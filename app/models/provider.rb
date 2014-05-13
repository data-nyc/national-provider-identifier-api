class Provider < ActiveRecord::Base

  validates :npi,        presence: true, uniqueness: true, length: {maximum: 10}
  validates :entity,     presence: true
  validates :legal_name, presence: true

end
