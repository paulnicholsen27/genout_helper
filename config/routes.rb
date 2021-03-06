Rails.application.routes.draw do
  resources :singers
  get "/text", to: "singers#text"
  post "/send_text", to: "singers#send_text"
  # resources :users, only: [:new, :create, :edit] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
