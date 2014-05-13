require "csv"

module CmsImportable
  def self.included(app)
    app.extend ClassMethods
  end

  module ClassMethods
    TRANSFORMERS = {
      'NPI' => :npi,
      'Entity Type Code' => :entity,
      'Employer Identification Number (EIN)' => :ein,
      'Provider First Name' => :first_name,
      'Provider Middle Name' => :middle_name,
      'Provider Name Prefix Text' => :prefix,
      'Provider Name Suffix Text' => :suffix,
      'Provider Credential Text' => :credential,
      'Provider Enumeration Date' => :enumerated_at,
      'Last Update Date' => :last_updated_at,
      'NPI Deactivation Reason Code' => :deactivated_reason_code,
      'NPI Deactivation Date' => :deactivated_at,
      'NPI Reactivation Date' => :reactivated_at,
      'Provider Gender Code' => :gender_code
    }

    def transform(row)
      result = row.headers.inject({}) do |key_value, header|
        transformed_header = TRANSFORMERS[header]

        key_value[transformed_header] = row[header] if transformed_header
        key_value
      end

      if result[:entity] == '1'
        result[:legal_name] = row['Provider Last Name (Legal Name)']
      else
        result[:legal_name] = row['Provider Organization Name (Legal Business Name)']
      end

      if result[:enumerated_at].present?
        result[:enumerated_at] = format_date result[:enumerated_at]
      end

      if result[:last_updated_at].present?
        result[:last_updated_at] = format_date result[:last_updated_at]
      end

      if result[:deactivated_at].present?
        result[:deactivated_at] = format_date result[:deactivated_at]
      end

      if result[:reactivated_at].present?
        result[:reactivated_at] = format_date result[:reactivated_at]
      end

      result
    end

    def format_date(string)
      array = string.split('/')
      "#{array[2]}-#{array[0]}-#{array[1]}"
    end

    def import(file_path)
      CSV.foreach(file_path, headers: true) do |csv|
        self.create(transform(csv))
      end
    end
  end
end
