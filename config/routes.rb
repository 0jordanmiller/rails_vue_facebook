Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'
  resources :posts
  get '/signup', to: 'landing#index'
  get '/signin', to: 'landing#index'
  get '/getposts', to: 'landing#posts'
  get '/posts', to: 'landing#index'



end
