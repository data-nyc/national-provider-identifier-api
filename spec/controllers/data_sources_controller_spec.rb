require 'spec_helper'

describe DataSourcesController do
  describe "GET 'index'" do
    describe "when json format is not set" do
      it "throws an UnknownFormat error" do
        expect {get :index}.to raise_error(ActionController::UnknownFormat)
      end
    end

    describe "when json format is set" do
      describe "when no params are provided" do
        it "responds with 200 OK" do
          get :index, {format: :json}
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe "GET 'show'" do
    describe "when json format is not set" do
      it "responds with 200 OK" do
        expect {get :show, {id: 1111}}.to raise_error(ActionController::UnknownFormat)
      end
    end

    describe "when json format is set" do
      describe "when given an id" do
        it "responds with 200 OK" do
          get :show, {format: :json, id: 1111}
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
