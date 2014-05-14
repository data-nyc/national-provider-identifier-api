HealthProviderApi::Application.routes.draw do
  get 'data_sources/index'

  get 'data_sources/show'

  scope '/v1' do
    resources :data_sources, defaults: {format: :json}
    resources :providers, defaults: {format: :json}
  end

  get "/ping", to: "application#ping"

  root to: redirect('/api')
end
