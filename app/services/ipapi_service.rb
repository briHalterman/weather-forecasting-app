require "httparty"

class IpapiService
  include HTTParty
  base_uri "http://ip-api.com"

  def fetch_coordinates
    query = { fields: "lat,lon" }
    response = self.class.get("/json", query: query)

    if response.success?
      data = JSON.parse(response.body)
      { latitude: data["lat"], longitude: data["lon"] }
    else
      { error: "Failed to fetch coordinates" }
    end
  end
end
