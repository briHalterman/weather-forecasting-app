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
    # render json: @locations
  end

  # Create new location
  def create
    # Extract params
    name = params[:name]
    latitude = params[:latitude].to_f # Convert to floating point
    longitude = params[:longitude].to_f # Convert to floating point

    # Add new location to memory
    location = Location.add(name, latitude, longitude)

    # render json: location, status: :created

    redirect_to locations_path
  end

  # Display forecast for specific location
  def forecast
    # Fetch Location by Id
    @location = Location.find_by_index(params[:id].to_i)

    # Initialize weather forecast service
    service = ForecastService.new

    # Fetch forecast from API
    @forecast_data = service.fetch_forecast(@location.latitude, @location.longitude)

    if @forecast_data[:error]
      # Catch error
      flash[:error] =  @forecast_data[:error]
      redirect_to locations_path
    end

    # Validate fetched data
    daily_forecast = @forecast_data["daily"]
    if daily_forecast["time"].nil? || daily_forecast["temperature_2m_max"].nil? || daily_forecast["temperature_2m_min"].nil?
      flash[:error] = "Error fetching complete data from API. Please try again."
      redirect_to locations_path
    end

    # Generate chart
    chart_service = ChartService.new
    @chart_url = chart_service.generate_temperature_chart(
      daily_forecast["time"],
      daily_forecast["temperature_2m_max"],
      daily_forecast["temperature_2m_min"]
    )

    # Return forecast
    render :forecast
  end

  # Get form to add new location
  def new
    @location = Location.new
  end

  def new_from_address
    # render form
  end

  def create_from_address
    address = params[:address]
    service = GeocodeService.new
    coordinates = service.fetch_coordinates(address)

    if coordinates[:error]
      flash[:alert] = "Error: #{coordinates[:error]}"
      redirect_to new_from_address_locations_path
    else
      name = params[:name]
      Location.add(name, coordinates[:latitude], coordinates[:longitude])
      redirect_to locations_path
    end
  end

  def new_from_ip
    # render form
  end

  def create_from_ip
    service = IpapiService.new
    coordinates = service.fetch_coordinates

    if coordinates[:error]
      flash[:alert] = "Error: #{coordinates[:error]}"
      redirect_to new_from_ip_locations_path
    else
      name = params[:name]
      Location.add(name, coordinates[:latitude], coordinates[:longitude])
      redirect_to locations_path
    end
  end
end
