Rails.application.routes.draw do
  devise_for :users
    root to: 'landing#index'
    get '/example', to: 'landing#example'

end
