require 'spec_helper'

describe DataSource do
  describe "validations" do
    let(:parameters) do
      {
        name: "a-file-name.csv",
        status: DataSource::DEFINED,
        transformer: "CmsDataTransformer"
      }
    end

    describe "when given no name" do
      it "fails on presence" do
        expect(DataSource.new).to validate_presence_of(:name)
      end
    end

    describe "when given no transformer" do
      it "fail on presence" do
        expect(DataSource.new).to validate_presence_of(:transformer)
      end
    end

    describe "when given a transformer" do
      it "can not use a RandomTransformer" do
        transformers = ["RandomTransformer"]
        expect(DataSource.new).to_not ensure_inclusion_of(:transformer).in_array(transformers)
      end

      it "can use a CmsDataTransformer" do
        transformers = ["CmsDataTransformer"]
        expect(DataSource.new).to ensure_inclusion_of(:transformer).in_array(transformers)
      end
    end
  end
end
