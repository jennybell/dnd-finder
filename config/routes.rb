Rails.application.routes.draw do
  resources :groups do 
    post 'invitations', to: 'invitations#create'
    patch 'invitations', to: 'invitations#update'
    post 'join', to: 'groups#join'
    post 'message', to: 'messages#create'
    resources :games do
      resources :game_responds
    end
    patch 'dm', to: 'groups#assign_dm'
  end

  devise_for :users 
  root to: 'home#index'
end
