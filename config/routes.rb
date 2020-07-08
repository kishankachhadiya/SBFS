Rails.application.routes.draw do
  devise_for :users
  root 'listings#index'
  post 'listings/search'
  get '/about' => 'pages#about'
  resources :users, only: [:index]
  resources :conditions
  resources :states
  resources :materials
  resources :hulls
  resources :riggings
  resources :kind_of_boats
  resources :manufacturers
  resources :listings do
    member do
      put 'like' => 'listings#like'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
