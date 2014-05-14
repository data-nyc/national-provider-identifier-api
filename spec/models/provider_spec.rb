require "spec_helper"

describe Provider do
  describe "validations" do
    let(:parameters) do
      {
        npi: "X0X0X0X0X0", entity: "Individual",
        legal_name: "a provider legal name"
      }
    end

    describe "when given no npi" do
      it "fails on presence" do
        expect(Provider.new).to validate_presence_of(:npi)
      end

      it "fails on uniqueness" do
        expect(Provider.new).to validate_uniqueness_of(:npi)
      end

      it "fails on length" do
        expect(Provider.new).to ensure_length_of(:npi)
      end
    end

    describe "when given an npi larger than 10 characters" do
      it "fails on length" do
        Provider.new(parameters.merge(npi: ('X' * 11))).should ensure_length_of(:npi)
      end
    end

    describe "when given an npi that has already been saved" do
      it "fails on uniqueness" do
        Provider.create(parameters)
        expect(Provider.new(parameters)).to validate_uniqueness_of(:npi)
      end
    end

    describe "when given no entity" do
      it "fails on presence" do
        expect(Provider.new).to validate_presence_of(:entity)
      end
    end

    describe "when given no legal_name" do
      it "fails on presence" do
        Provider.new.should validate_presence_of(:legal_name)
      end
    end
  end
end
