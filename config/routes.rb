Rails.application.routes.draw do
  resources :groups do 
<<<<<<< HEAD
    post 'invitations', to: 'invitations#create'
    patch 'invitations', to: 'invitations#update'
    post 'join', to: 'groups#join'
    post 'message', to: 'messages#create'
=======
    post '/join', to: 'groups#join'
    post '/message', to: 'messages#create'
    resources :games
>>>>>>> 04ac1d7 (built schedule game time and date functionality)
  end

  devise_for :users 
  root to: 'home#index'
end
