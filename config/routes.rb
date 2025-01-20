Rails.application.routes.draw do
  # Health check route - leave as is
  get "up" => "rails/health#show", as: :rails_health_check

  # Define RESTful routes for locations
  resources :locations, only: [:index, :show, :create]
end
