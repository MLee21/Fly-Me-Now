Rails.application.routes.draw do
  root 'home#index'
  resources :geolocator, only: ["create"]
  resources :flights, only: ["show", "index"]
end
