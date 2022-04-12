Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :production_roles
  resources :productions, only: [:index, :show, :destroy]

  # Break Out Activity #1 => Add Route to Handle "sessions#login" (/login)
end
