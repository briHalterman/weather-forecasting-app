# httparty gem used for making HTTP requests
require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'https://api.open-meteo.com'

  # Fetch forecast
  def fetch_forecast(latitude, longitude)
    # Query params
    query = {
      latitude: latitude,
      longitude: longitude,
      daily: "temperature_2m_max,temperature_2m_min",
      forecast_days: 7
    }

    # API Request
    response = self.class.get('/v1/forecast', query: query)

    # Handle response
    handle_response(response)
  end

  private

  def handle_response(response)
    JSON.parse(response.body)
  end
end