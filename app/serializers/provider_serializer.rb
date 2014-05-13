class ProviderSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object

  attributes :npi, :entity, :ein, :legal_name
  attributes :first_name, :middle_name, :prefix, :suffix, :credential
  attributes :enumerated_at, :last_updated_at
  attributes :deactivated_reason_code, :deactivated_at, :reactivated_at
  attributes :gender_code, :updated_at
end
