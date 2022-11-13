Rails.application.routes.draw do
  resources :followers
  resources :likes
  resources :tweets
  devise_for :users
  root 'pages#index'
end
