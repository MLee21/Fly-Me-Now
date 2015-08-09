Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  root 'home#index'
  resources :geolocator, only: ["create"]
  resources :flights, only: ["show", "index"]

  get "/templates/:filename", to: "templates#show"
end
