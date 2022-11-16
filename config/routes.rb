Rails.application.routes.draw do

  root 'pages#index'
  devise_for :users, path: "api/v1",
                     path_names: {
                       sign_in:  "login",
                       sign_out: "logout"
                     }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tweets do
        member do
          post :retweet
        end
      end

      resources :follows do
        collection do
          get 'followers'
          get 'followed'
        end
      end

      resources :likes do
        collection do
          post 'like'
          delete 'unlike'
        end
      end


      
      get '/:username', to: 'tweets#show'
    end
  end
end
