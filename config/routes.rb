Rails.application.routes.draw do
  # Health check route - leave as is
  get "up" => "rails/health#show", as: :rails_health_check

  # Define RESTful routes for locations
  resources :locations, only: [ :index, :create, :new ] do
    member do
      get :forecast
    end
    collection do
      get :new_from_address
      post :create_from_address
    end
  end
end
