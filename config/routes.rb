Rails.application.routes.draw do
  root to: 'landing#index'
  devise_for :users
  resources :posts
  resources :friends
  resources :friend_requests, except: [:show, :edit, :new, :update], path: 'friend_requests' do
      

    collection do
      delete '/:receiver/:sender', action: :destroy
      get '/sent_to', action: :sent_to
    end
  end

  get '/users', to: 'users#index'
  get '/*', to: "landing#index"



end
