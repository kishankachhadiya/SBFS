Rails.application.routes.draw do
  root 'listings#index'
  post 'listings/search'
  resources :conditions
  resources :states
  resources :materials
  resources :hulls
  resources :riggings
  resources :kind_of_boats
  resources :manufacturers
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
