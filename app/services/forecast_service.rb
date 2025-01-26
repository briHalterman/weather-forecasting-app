# httparty gem used for making HTTP requests
require "httparty"

class ForecastService
  include HTTParty
  base_uri "https://api.open-meteo.com"

  def fetch_forecast(latitude, longitude)
    # Validate input
    if latitude.nil? || longitude.nil? ||
      !valid_coordinate?(latitude, -90, 90) ||
      !valid_coordinate?(longitude, -180, 180)

      return { error: "Please provide valid longitude and latitude." }
    end

    query = {
      latitude: latitude,
      longitude: longitude,
      daily: "temperature_2m_max,temperature_2m_min,precipitation_sum,wind_speed_10m_max,sunrise,sunset",
      timezone: "auto",
      forecast_days: 7
    }

    begin
      response = self.class.get("/v1/forecast", query: query)

      if response.success?
        JSON.parse(response.body)
      else
        { error: "Failed to fetch forecast: #{response.message}" }
      end
    rescue StandardError => e
      { error: "Error: #{e.message}" }
    end
  end

  private

  def valid_coordinate?(value, min, max)
    value.is_a?(Numeric) && value.between?(min, max)
  end
end
