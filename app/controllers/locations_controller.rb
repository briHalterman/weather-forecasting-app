# Actions
# 1. list all locations
# 2. create new location
# 3. display forecast for specific location

class LocationsController < ApplicationController
  # Protect browser requests, reset session for APIs
  protect_from_forgery with: :null_session

  # List all locations
  def index
    @locations = Location.all
    render json: @locations
  end

  # Create new location
  def create
    # Extract params
    name = params[:name]
    latitude = params[:latitude].to_f # Convert to floating point
    longitude = params[:longitude].to_f # Convert to floating point

    # Add new location to memory
    location = Location.add(name, latitude, longitude)

    render json: location, status: :created
  end

  # Display forecast for specific location
  def forecast
    # Fetch Location by Id
    location = Location.find_by_index(params[:id].to_i)

    # Initialize weather forecast service
    service = ForecastService.new

    # Fetch forecast from API
    forecast_data = service.fetch_forecast(location.latitude, location.longitude)

    if forecast_data[:error]
      # Catch error
      render json: forecast_data, status: :bad_request
    else
      # Return forecast
      render json: forecast_data
    end
  end
end
