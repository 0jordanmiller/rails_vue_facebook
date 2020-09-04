Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'
  get '/signup', to: 'landing#index'
  get '/signin', to: 'landing#index'
  get '/posts', to: 'landing#index'
  get '/getposts', to: 'landing#posts'
  


end
