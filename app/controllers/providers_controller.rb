class ProvidersController < ApplicationController
  respond_to :json

  PAGE_OFFSET = 0
  PAGE_SIZE = 50

  swagger_controller :providers, "Providers"

  swagger_api :index do
    summary "Search Multiple Providers"
    param :query, :entity, :integer, :optional, "Entity (individual=1, organization=2)"
    param :query, :offset, :integer, :optional, "Pagination offset"
    param :query, :page,   :integer, :optional, "Pagination page"
  end

  # GET /providers
  # GET /providers.json
  def index
    if index_search_params?
      if params[:entity]
        @providers = Provider.where(entity: params[:entity].to_s).offset(params[:offset] || PAGE_OFFSET).limit(params[:page] || PAGE_SIZE)
      end

      respond_with @providers
    else
      head 400
    end
  end

  swagger_api :show do
    summary "Search Single Provider"
    param :query, :id, :string, :optional, "National Provider Identity (npi)"
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @provider = Provider.where(npi: params[:id]).first
    respond_with @provider
  end

  private

  def index_search_params?
    !!(params[:entity])
  end
end
