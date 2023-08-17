Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, path: 'api/v1', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
