Rails.application.routes.draw do
  # BREAK OUT ACTIVITY #2

  # 1. Add Resources for Tickets
  # 2. Add Resources for Users
  # 3. Add Resources for Production Roles

  # NOTE: Make sure to check routes in console with "rails routes"
  
  resources :productions, only: [:index, :show]
  resources :production_roles, only: [:index, :show]
  resources :tickets, only: [:index, :show]
  resources :users, only: [:index, :show]



  #  get '/productions', to: 'production#index'


end
