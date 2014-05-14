module DataSourcesControllerSwaggerDocs
  def self.included(app)
    if Rails.env.development?
      app.send :swagger_controller, :data_sources, "Data Sources"

      app.send :swagger_api, :index do
        summary "List Multiple Data Sources"
        param :query, :status, :string,  :optional, "DEFINED, READY-TO-PROCESS, COMPLETE"
        param :query, :offset, :integer, :optional, "Pagination offset"
        param :query, :page,   :integer, :optional, "Pagination page"
      end

      app.send :swagger_api, :show do
        summary "Show Single Data Source"
        param :path, :id, :string, :required, "Data Source ID"
      end
    end
  end
end
