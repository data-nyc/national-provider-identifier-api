class Provider < ActiveRecord::Base

  include CmsImportable

  validates :npi,        presence: true, uniqueness: true, length: {maximum: 10}
  validates :entity,     presence: true
  validates :legal_name, presence: true

end
