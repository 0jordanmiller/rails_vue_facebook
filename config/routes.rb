Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'
  resources :posts
  get '/signup', to: 'landing#index'
  get '/signin', to: 'landing#index'
  get '/posts', to: 'landing#index'
  get '/profile', to: 'landing#index'



end
