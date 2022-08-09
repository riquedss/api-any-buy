# frozen_string_literal: true

Rails.application.routes.draw do
  post 'login', to: 'auth#login'
  post 'signup', to: 'auth#signup'

  put 'users/adm/:id', to: 'users#update_adm'
  resources :users

  get 'products/konsol-game', to: 'products#index_konsol_game'
  get 'products/laptop', to: 'products#index_laptop'
  get 'products/smartphone', to: 'products#index_smartphone'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
