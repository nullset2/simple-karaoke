Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
  get "home/index"

  patch "name", to: "application#update_name", as: :update_name
  get "tv", to: "requests#index"
  get "admin", to: "requests#admin"
  root "home#index"
end
