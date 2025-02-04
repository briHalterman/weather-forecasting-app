require 'rails_helper'

# Tests:
# Present with name, latitude & longitude
# Latitude and longitude are numbers
# Latitude and longitude are with range

RSpec.describe ForecastLocation, type: :model do
  it "is valid with a name, latitude, and longitude" do
    location = ForecastLocation.new(name: "Menomonie", latitude: 44.8755, longitude: 91.9193)
    expect(location).to be_valid
  end

  it "is invalid without a name" do
    location = ForecastLocation.new(latitude: 44.8755, longitude: 91.9193)
    expect(location).not_to be_valid
  end

  it "is invalid without a latitude" do
    location = ForecastLocation.new(name: "Menomonie", longitude: 91.9193)
    expect(location).not_to be_valid
  end

  it "is invalid without a longitude" do
    location = ForecastLocation.new(name: "Menomonie", latitude: 44.8755)
    expect(location).not_to be_valid
  end

  it "is invalid if the latitude is out of range" do
    location = ForecastLocation.new(name: "Menomonie", latitude: 100, longitude: 91.9193)
    expect(location).not_to be_valid
  end

  it "is invalid if the longitude is out of range" do
    location = ForecastLocation.new(name: "Menomonie", latitude: 44.8755, longitude: 200)
    expect(location).not_to be_valid
  end
end
