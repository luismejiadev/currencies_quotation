Rails.application.routes.draw do

  resources :user_sessions
  resources :users
  resources :quotations
  resources :currencies

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  root 'home#index'
end
