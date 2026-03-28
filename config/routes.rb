Rails.application.routes.draw do
  get "requests/index"
  get "requests/admin"
  get "requests/create"
  get "request/index"
  get "request/admin"
  get "request/create"
  devise_for :users
  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "tv", to: "requests#index"
  get "admin", to: "requests#admin"
  root "home#index"
end
