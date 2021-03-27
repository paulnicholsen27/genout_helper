Rails.application.routes.draw do
  devise_for :users
  resources :singers
  get "/text", to: "singers#text"
  post "/send_text", to: "singers#send_text"
  root to: "singers#index" #TODO set to real homepage
  # get "/users/sign_out", to: "devise/sessions#destroy", as: "logout" 
  # get "/login", to: "sessions#login_form"
  # post "/login", to: "sessions#login"
  # get "/logout", to: "sessions#logout"
  # resources :users, only: [:new, :create, :edit, :update] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
