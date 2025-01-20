# Actions
# 1. list all locations
# 2. display specific location
# 3. create new location

class LocationsController < ApplicationController
  # Protect browser requests, reset session for APIs
  protect_from_forgery with: :null_session

  # List all locations
  def index
    @locations = Location.all
    render json: @locations
  end

  # Display specific location
  def show
    @location = Location.find_by_index(params[:id].to_i)
    render json: @location
  end

  # Create new location
  def create
    name = params[:name]
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f

    location = Location.add(name, latitude, longitude)

    render json: location, status: :created
  end

  # Fetch forecast for specific location
  def forecast
    # Fetch Location by Id
    location = Location.find_by_index(params[:id].to_i)

    service = ForecastService.new

    # Fetch forecast from API
    forecast_data = service.fetch_forecast(location.latitude, location.longitude)

    # Return forecast
    render json: forecast_data
  end
end
