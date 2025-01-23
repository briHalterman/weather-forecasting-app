# httparty gem used for making HTTP requests
require "httparty"

class ForecastService
  include HTTParty
  base_uri "https://api.open-meteo.com"

  # Fetch forecast
  def fetch_forecast(latitude, longitude)
    # Query params
    query = {
      latitude: latitude,
      longitude: longitude,
      daily: "temperature_2m_max,temperature_2m_min,precipitation_sum,wind_speed_10m_max,sunrise,sunset",
      timezone: "auto",
      forecast_days: 7
    }

    begin
      # API Request
      response = self.class.get("/v1/forecast", query: query)

      if response.success?
        # Return forecast
        JSON.parse(response.body)
      else
        { error: "Failed to fetch forecast: #{response.message}" }
      end
    end
  end
end
