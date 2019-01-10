Rails.application.routes.draw do
  devise_for :users
  resources :listings, only: [:index, :create, :destroy]
  post "/listings/search", to: 'listings#search'

  root to: 'home#landing'
end
