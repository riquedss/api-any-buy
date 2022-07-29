Rails.application.routes.draw do
  post 'login', to: 'auth#login'
  post 'signup', to: 'auth#signup'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
