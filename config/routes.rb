# frozen_string_literal: true

Rails.application.routes.draw do
  post 'login', to: 'auth#login'
  post 'signup', to: 'auth#signup'

  put 'users/adm/:id', to: 'users#update_adm'
  resources :users
  resources :products
  resources :carts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
