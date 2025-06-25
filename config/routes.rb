Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: "rooms#index"

  resources :users, only: [:edit,:update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
