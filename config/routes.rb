Rails.application.routes.draw do
  resources :groups do 
    post 'invitations/create', to: 'invitations#create'
    post 'join', to: 'groups#join'
    post 'message', to: 'messages#create'
  end

  devise_for :users 
  root to: 'home#index'
end
