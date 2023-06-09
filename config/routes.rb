Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resources :posts, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]

  root "posts#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
