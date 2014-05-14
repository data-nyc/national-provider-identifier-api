class DataSourcesController < ApplicationController
  respond_to :json

  PAGE_OFFSET = 0
  PAGE_SIZE = 50

  include DataSourcesControllerSwaggerDocs

  def index
    @data_sources = DataSource.offset(params[:offset] || PAGE_OFFSET).limit(params[:page] || PAGE_SIZE)
    response_with @data_sources
  end

  def show
    @data_source = DataSource.find(params[:id])
    response_with @data_source
  end
end
