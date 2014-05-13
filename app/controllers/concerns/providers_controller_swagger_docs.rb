module ProvidersControllerSwaggerDocs
  def self.included(app)
    if Rails.env.development?
      app.send :swagger_controller, :providers, "Providers"

      app.send :swagger_api, :index do
        summary "Search Multiple Providers"
        param :query, :entity, :integer, :optional, "Individual=1, Organization=2"
        param :query, :offset, :integer, :optional, "Pagination offset"
        param :query, :page,   :integer, :optional, "Pagination page"
      end

      app.send :swagger_api, :show do
        summary "Search Single Provider"
        param :path, :id, :string, :required, "National Provider Identity"
      end
    end
  end
end
