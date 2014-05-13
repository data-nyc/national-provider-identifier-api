require "csv"
require "open-uri"

class DataSource < ActiveRecord::Base
  class DataSourceTransformerInvalidError < StandardError; end

  validates :name,        presence: true, uniqueness: true, length:{maximum: 1024}
  validates :status,      presence: true
  validates :transformer, presence: true

  after_find   :apply_transformer
  after_create :apply_transformer

  def self.next
    # remove this and setup a queue!
    DataSource.where(["status = ?", 'READY-TO-PROCESS']).order('updated_at').first
  end

  def import
    CSV.foreach(temp_file.path, headers: true, encoding: encoding) do |csv|
      if block_given?
        yield transform(csv)
      else
        Provider.create(transform(csv))
      end
    end
  end

  def temp_file
    open(name)
  end

  def transform(row)
    raise DataSourceTransformerInvalidError.new
  end

  private
  
  def applied_transformer?
    extended_modules.include? CmsDataTransformer
  end

  def apply_transformer
    self.extend Object.const_get(transformer) unless applied_transformer?
  end

  def extended_modules
    (class << self; self end).included_modules
  end
end
