Rails.application.routes.draw do
  devise_for :users
  resources :singers
  get "/text", to: "messages#text"
  post "/send_text", to: "messages#send_text"
  get "/approve_users", to: "users#index"
  get "/approve_user/:id", to: "users#approve_user", as: "approve_user"
  root to: "singers#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
