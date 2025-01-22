require "httparty"

class GeocodeService
  include HTTParty
  base_uri "https://geocode.xyz"

  def fetch_coordinates(address)
    query = {
      locate: address,
      json: 1
    }

    response = self.class.get("/", query: query)

    if response.success?
      data = JSON.parse(response.body)
      if data["error"]
        { error: data["error"] }
      else
        {
          latitude: data["latt"].to_f,
          longitude: data["longt"].to_f
        }
      end
    else
      { error: "Failed to fetch coordinates" }
    end
  end
end
