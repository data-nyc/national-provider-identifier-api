HealthProviderApi::Application.routes.draw do
  scope '/v1' do
    resources :providers, defaults: {format: :json}
  end

  root to: redirect('/api')
end
