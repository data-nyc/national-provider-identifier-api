class ProvidersController < ApplicationController
  respond_to :json

  PAGE_OFFSET = 0
  PAGE_SIZE = 50

  include ProvidersControllerSwaggerDocs

  # GET /providers
  # GET /providers.json
  def index
    if index_search_params?
      if params[:entity]
        @providers = Provider.where(entity: params[:entity].to_s).offset(params[:offset] || PAGE_OFFSET).limit(params[:page] || PAGE_SIZE)
      end

      respond_with ActiveModel::ArraySerializer.new(@providers, each_serializer: ProviderSerializer)
    else
      head 400
    end
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
