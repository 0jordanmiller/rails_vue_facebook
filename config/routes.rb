Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'
  resources :posts
  resources :friend_requests, path: 'friend_requests' do
    collection do
      delete '/:user1/:user2', action: :destroy
    end
  end

  resources :friends

  get '/signup', to: 'landing#index'
  get '/signin', to: 'landing#index'
  get '/posts', to: 'landing#index'
  get '/profile', to: 'landing#index'


end
