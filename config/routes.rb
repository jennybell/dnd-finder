Rails.application.routes.draw do
  resources :groups do 
    post '/join', to: 'groups#join'
  end

  devise_for :users 
  root to: 'home#index'
end
