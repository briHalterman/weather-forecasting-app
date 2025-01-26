require "httparty"

class GeocodeService
  include HTTParty
  base_uri "https://geocode.xyz"

  def fetch_coordinates(address)
    #  Validate input
    if address.nil? || address.empty?
      return { error: "Please provide a valid address, postal code or city name." }
    end

    query = {
      locate: address,
      json: 1
    }

    begin
      response = self.class.get("/", query: query)

      if response.success?
        data = JSON.parse(response.body)
        if data["error"]
          { error: "API error: #{data["error"]}" }
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
end
