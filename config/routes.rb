Rails.application.routes.draw do
  root to: 'landing#index'
  devise_for :users
  resources :posts
  resources :comments, except: %i[show new update index]
  resources :friends
  resources :notifications, only: %i[index create destroy]
  resources :friend_requests, except: %i[show edit new update], path: 'friend_requests' do
    collection do
      delete '/:receiver/:sender', action: :destroy
      get '/sent_to', action: :sent_to
    end
  end
  resources :users, only: %i[show index]

  post '/like_post', to: 'likes#create'
  delete '/like_post', to: 'likes#destroy'
  get '/*', to: 'landing#index'
  post '/upload', to: 'upload#upload_picture'
end
