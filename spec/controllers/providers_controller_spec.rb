require "spec_helper"

describe ProvidersController do
  describe "GET index" do
    describe "when no search params are provided" do
      it "is a 400 Bad Request" do
        get :index, {format: :json}
        expect(response.status).to eq(400)
      end
    end

    describe "when given an npi search criteria" do
      it "is a 200 OK" do
        get :index, {format: :json, npi: "1588667638"}
        expect(response.status).to eq(200)
      end

      it "limits on the npi" do
        incorrect = Provider.create(npi: "1111111111", entity: 1, legal_name: "BAD RESULT")
        provider = Provider.create(npi: "1588667638", entity: 2, legal_name: "PILCHER")
        get :index, {format: :json, npi: "1588667638"}
        expect(assigns(:providers)).to eq([provider])
      end
    end

    describe "when given an entity search criteria" do
      it "is a 200 OK" do
        get :index, {format: :json, entity: 1}
        expect(response.status).to eq(200)
      end

      it "limits on the npi result" do
        incorrect = Provider.create(npi: "1111111111", entity: 2, legal_name: "BAD RESULT")
        provider = Provider.create(npi: "1588667638", entity: 1, legal_name: "PILCHER")
        get :index, {format: :json, npi: "1588667638"}
        expect(assigns(:providers)).to eq([provider])
      end
    end
  end
end
