Rails.application.routes.draw do
  resources :requests
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users
  patch "name", to: "application#update_name", as: :update_name

  get "home/index"
  resources :requests do
    post :rank_up, to: "requests#rank_up"
    post :rank_down, to: "requests#rank_down"
  end

  get "tv", to: "requests#index"
  get "admin", to: "requests#admin"
  
  root "home#index"
end
