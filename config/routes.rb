Rails.application.routes.draw do
  root "home#index"
  resources :home
  post "/message", to:"home#message"
  resources :prankees
end
