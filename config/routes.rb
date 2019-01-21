Rails.application.routes.draw do
  devise_for :users
  resources :listings, only: [:create, :destroy]
  resources :hunts, only: [:index, :create, :update, :destroy]
  post "/hunts/add_user", to: 'hunts#add_user'
  post "/users/get_user_info", to: 'users#get_user_info'
  post "/listings/search", to: 'listings#search'
  root to: 'home#landing'
end
