HealthProviderApi::Application.routes.draw do
  scope '/v1' do
    resources :data_sources, defaults: {format: :json}
    resources :providers, defaults: {format: :json}
  end

  get "/ping", to: "application#ping"

  root to: redirect('/api')
end
