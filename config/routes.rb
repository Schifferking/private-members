Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"

  resources :events, only: [:new, :create, :index, :show]
  resources :users, only: [:show]
  resources :user_events, only: [:new, :create]
end
