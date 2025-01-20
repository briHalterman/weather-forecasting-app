# Actions
# 1. list all locations
# 2. display specific location
# 3. create new location

class LocationsController < ApplicationController
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

    render json: location, status: created
  end
end
