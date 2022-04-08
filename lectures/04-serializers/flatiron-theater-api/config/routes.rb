Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :production_roles
  resources :productions, only: [:index, :show, :destroy]

  get '/productions/:production_id/users/:user_id', to: 'productions#user_show'
end
