Rails.application.routes.draw do
  resources :tickets
  resources :users
  # resources :production_roles
  resources :productions, only: [:index, :show, :create]

#  get '/production', to: 'production#index'
end
