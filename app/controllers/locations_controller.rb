# Actions
# 1. list all locations
# 2. create new location
# 3. display forecast for specific location

class LocationsController < ApplicationController
  # Protect browser requests, reset session for APIs
  protect_from_forgery with: :null_session

  # List all locations
  def index
    @locations = ForecastLocation.all
    # render json: @locations
  end

  def create
    @location = ForecastLocation.new(location_params)

    if @location.save
      redirect_to locations_path
    else
      flash[:alert] = "Failed to add new location. Please try again."
    end
  end

  # Display forecast for specific location
  def forecast
    # Fetch Location by Id
    Rails.logger.debug "Fetching location with ID: #{params[:id]}"

    @location = ForecastLocation.find_by(id: params[:id].to_i)

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
    @location = ForecastLocation.new
  end

  def new_from_address
    # render form
    @location = ForecastLocation.new
  end

  def create_from_address
    address = params[:forecast_location][:address]
    service = GeocodeService.new
    coordinates = service.fetch_coordinates(address)

    if coordinates[:error]
      flash[:alert] = "Error: #{coordinates[:error]}"
      redirect_to new_from_address_locations_path
    else
      # name = params[:name]
      # Location.add(name, coordinates[:latitude], coordinates[:longitude])
      @location = ForecastLocation.new(
        name: params[:forecast_location][:name],
        latitude: coordinates[:latitude],
        longitude: coordinates[:longitude]
      )

      if @location.save
        redirect_to locations_path, notice: "Location saved!"
      else
        flash[:alert] = "Failed to save location."
        render :new_from_address, status: :unprocessable_entity
      end
    end
  end

  def new_from_ip
    # render form
    @location = ForecastLocation.new
  end

  def create_from_ip
    service = IpapiService.new
    coordinates = service.fetch_coordinates

    if coordinates[:error]
      flash[:alert] = "Error: #{coordinates[:error]}"
      redirect_to new_from_ip_locations_path
    else
      # name = params[:name]
      # Location.add(name, coordinates[:latitude], coordinates[:longitude])
      @location = ForecastLocation.new(name: params[:forecast_location][:name], latitude: coordinates[:latitude], longitude: coordinates[:longitude])

      if @location.save
        redirect_to locations_path
      else
        flash[:alert] = "Failed to save location"
      end
    end
  end

  private

  def location_params
    params.require(:forecast_location).permit(:name, :latitude, :longitude)
  end
end
