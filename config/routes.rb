Rails.application.routes.draw do
  root "sessions#new"
  resources :home
  post "/message", to:"home#message"
  resources :prankees
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
