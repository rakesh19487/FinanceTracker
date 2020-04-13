Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root 'welcomes#index'\

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search_stocks'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search_friends'

  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships
end
