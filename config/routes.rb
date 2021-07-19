Rails.application.routes.draw do
  resources :groups do 
    post 'invitations', to: 'invitations#create'
    patch 'invitations', to: 'invitations#update'
    get 'invitations', to: 'invitations#show'
    post 'join', to: 'groups#join'
    post 'message', to: 'messages#create'
    resources :games
    patch 'dm', to: 'groups#assign_dm'
  end

  resources :messages do
    resources :comments
  end

  devise_for :users 
  resource :users
  match '/users/:id', to: 'users#show', via: 'get'
  root to: 'home#index'
end
