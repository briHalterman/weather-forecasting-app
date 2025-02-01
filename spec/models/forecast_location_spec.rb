require 'rails_helper'

RSpec.describe ForecastLocation, type: :model do
  it "is valid with a name, latitude, and longitude" do
    location = ForecastLocation.new(name: "Menomonie", latitude: 44.8755, longitude: 91.9193)
    expect(location).to be_valid
  end
end
