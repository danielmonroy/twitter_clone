Rails.application.routes.draw do
  get '/:username', to: 'tweets#show'
  resources :follows do
    member do
      get 'followers'
      get 'followed'
    end
  end
  resources :likes
  resources :tweets
  devise_for :users
  root 'tweets#index'
end
