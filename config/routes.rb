Rails.application.routes.draw do
  resources :listings, only: [ :create, :destroy]
  post "/listings", to: 'listings#search'

  root to: 'listings#index'
end
