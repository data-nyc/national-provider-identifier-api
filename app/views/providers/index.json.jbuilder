json.array!(@providers) do |provider|
  json.extract! provider, :npi, :entity, :ein, :legal_name, :first_name, :middle_name, :prefix, :suffix, :credential, :enumerated_at, :last_updated_at, :deactivated_reason_code, :deactivated_at, :reactivated_at, :gender_code
  json.url provider_url(provider, format: :json)
end
