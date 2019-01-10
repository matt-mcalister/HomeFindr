Rails.application.routes.draw do
  resources :listings, only: [ :create, :index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
