require 'rails_helper'

RSpec.describe "Locations", type: :request do
  describe "GET /locations" do
    it "displays the list of locations!" do
      get locations_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /locations" do
    it "creates a new location" do
      expect {
        post locations_path, params: { forecast_location: { name: "Apex", latitude: 35.7327, longitude: 78.8503 } }
      }.to change(ForecastLocation, :count).by(1)

      expect(response).to redirect_to(locations_path)
    end
  end
end