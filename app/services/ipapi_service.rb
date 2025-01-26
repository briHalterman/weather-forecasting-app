require "httparty"

class IpapiService
  include HTTParty
  base_uri "http://ip-api.com"

  def fetch_coordinates
    begin
      query = { fields: "lat,lon" }
      response = self.class.get("/json", query: query)

      if response.success?
        data = JSON.parse(response.body)
        if data["error"]
          { error: "API error: #{data["error"]}" }
        else
        { latitude: data["lat"], longitude: data["lon"] }
        end
      else
        { error: "Failed to fetch coordinates" }
      end
    end
  end
end
