Rails.application.routes.draw do
  get 'messages/index'
  root to: "messages#index"

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
