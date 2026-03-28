Rails.application.routes.draw do
  resources :requests
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users
  patch "name", to: "application#update_name", as: :update_name

  get "home/index"
  resources :requests, only: [:create]

  get "tv", to: "requests#index"
  get "admin", to: "requests#admin"
  
  root "home#index"
end
