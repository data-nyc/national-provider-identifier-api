require_relative "../../app/models/concerns/cms_importable"

describe CmsImportable do
  describe "#import" do
    describe "given 1 individual row with a header row" do
      let(:fixture) { "spec/fixtures/npidata_1_individual_row.csv" }

      it "creates a record" do
        Object.include CmsImportable

        options = {
          npi: '1184627754',
          entity: '1',
          ein: '',
          legal_name: 'PRICE',
          first_name: 'DEBRA',
          middle_name: '',
          prefix: 'DR.', suffix: '', credential: 'MD',
          enumerated_at: '05/27/2005',
          last_updated_at: '04/14/2014',
          deactivated_reason_code: '',
          deactivated_at: '05/31/2005',
          reactivated_at: '09/26/2005',
          gender_code: 'F'
        }

        Object.should_receive(:create).with(options)
        Object.import(fixture)
      end
    end

    describe "given 1 organization row with a header row" do
      let(:fixture) { "spec/fixtures/npidata_1_organization_row.csv" }

      it "creates a record" do
        Object.include CmsImportable

        options = {
          npi: '1366445892',
          entity: '2',
          ein: '<UNAVAIL>',
          legal_name: 'TU EQUIPO MEDICO ISLA INC',
          first_name: '',
          middle_name: '',
          prefix: '', suffix: '', credential: '',
          enumerated_at: '05/30/2005',
          last_updated_at: '04/14/2014',
          deactivated_reason_code: '',
          deactivated_at: '',
          reactivated_at: '',
          gender_code: ''
        }

        Object.should_receive(:create).with(options)
        Object.import(fixture)
      end
    end
  end
end
