Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # post "/login", to: "sessions#create"
      # delete "/logout", to: "sessions#destroy"
      #
      # post "/signup", to: "users#create"
      # get "/confirmation", to: "users#confirmation"
      # post "/forgot_password", to: "users#forgot_password"
      # get "/reset_password", to: "users#reset_password"
      # post "/update_password", to: "users#update_password"
      # delete "/destroy_account", to: "users#destroy"

      post 'authenticate', to: 'authentication#authenticate'

      post 'reports/by_author', to: 'reports#create_report', controller: "reports"

      resources :posts, controller: "posts"
    end
  end

  get 'upload/index'
  post 'upload/upload'
  root 'upload#index'
end
