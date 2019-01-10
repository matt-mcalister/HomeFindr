Rails.application.routes.draw do
  devise_for :users
  resources :listings, only: [:create, :destroy]
  resources :hunts, only: [:create, :update, :destroy]
  post "/listings/search", to: 'listings#search'
  root to: 'home#landing'
end
