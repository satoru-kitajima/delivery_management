Rails.application.routes.draw do
  get '/' => 'requests#index'
 
  resources :requests, except: [:show]

  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  get "up" => "rails/health#show", as: :rails_health_check
end
