class ProvidersController < ApplicationController
  respond_to :json

  PAGE_OFFSET = 1
  PAGE_SIZE = 50

  swagger_controller :providers, "Providers"

  # GET /providers
  # GET /providers.json
  def index
    if index_search_params?
      if params[:npi]
        @providers = Provider.where(npi: params[:npi])
      elsif params[:entity]
        @providers = Provider.where(entity: params[:entity]).offset(PAGE_OFFSET).limit(PAGE_SIZE)
      end

      respond_with @providers
    else
      head 400
    end
  end

  swagger_api :index do
    summary "Search Providers"
    param :query, :npi,    :string,  :optional, "National Provider Identity"
    param :query, :entity, :integer, :optional, "Entity (Individual=1, Organization=2)"
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @provider = Provider.find(params[:id])
    respond_with @provider
  end

  private

  def index_search_params?
    !!(params[:npi] || params[:entity])
  end
end
