Rails.application.routes.draw do
  defaults format: :json do
    resources :posts
  end
  root to: 'landing#index'
  devise_for :users
  resources :comments, except: [:show, :new, :update, :index]
  resources :friends
  resources :friend_requests, except: [:show, :edit, :new, :update], path: 'friend_requests' do
    collection do
      delete '/:receiver/:sender', action: :destroy
      get '/sent_to', action: :sent_to
    end
  end
  post '/like_post', to: 'likes#create'
  delete '/like_post', to: 'likes#destroy'
  get '/users', to: 'users#index'
  get '/*', to: "landing#index"
end
