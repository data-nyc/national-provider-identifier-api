require "spec_helper"

describe ProvidersController do
  describe "GET index" do
    describe "when no search params are provided" do
      it "responds with 400 Bad Request" do
        get :index, {format: :json}
        expect(response.status).to eq(400)
      end
    end

    describe "when given an entity search criteria" do
      it "responds with 200 OK" do
        get :index, {format: :json, entity: 1}
        expect(response.status).to eq(200)
      end

      it "filters by the entity" do
        incorrect = Provider.create(npi: "1111111111", entity: 2, legal_name: "BAD RESULT")
        provider = Provider.create(npi: "1588667638", entity: 1, legal_name: "PILCHER")

        get :index, {format: :json, entity: "1"}
        expect(assigns(:providers)).to match_array([provider])
      end
    end
  end

  describe "GET show" do
    describe "when given an id" do
      it "responds with 200 OK" do
        get :show, {format: :json, id: "1588667638"}
        expect(response.status).to eq(200)
      end

      it "finds by the id" do
        incorrect = Provider.create(npi: "1111111111", entity: 1, legal_name: "BAD RESULT")
        provider = Provider.create(npi: "1588667638", entity: 2, legal_name: "PILCHER")

        get :show, {format: :json, id: "1588667638"}
        expect(assigns(:provider)).to eq(provider)
      end
    end
  end
end
