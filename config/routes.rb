Rails.application.routes.draw do
  resources :singers
  get "/text", to: "singers#text"
  post "/send_text", to: "singers#send_text"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  get "/logout", to: "sessions#logout"
  # resources :users, only: [:new, :create, :edit] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
