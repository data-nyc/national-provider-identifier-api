Swagger::Docs::Config.register_apis({
  "1.0" => {
    api_extension_type: :json,
    api_file_path: "public",
    base_path: "http://health-provider-api.herokuapp.com",
    clean_directory: false,
    formatting: :pretty
  }
})
