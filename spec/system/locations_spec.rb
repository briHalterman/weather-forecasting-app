require 'rails_helper'

RSpec.describe "Managing Locations", type: :system do
  before do
    driven_by(:rack_test) # Uses a headless browser
  end

  it "allows a user to add a location using coordinates" do
    visit locations_path
    click_link "Add Location from Coordinates"

    fill_in "Location Name", with: "RoleModel Software"
    fill_in "forecast_location[latitude]", with: "35.6879591"
    fill_in "forecast_location[longitude]", with: "-78.8358726"

    click_button "Add Location"

    expect(page).to have_content("RoleModel Software")
  end

  it "allows a user to add a location using an address" do
    visit locations_path
    click_link "Add Location from Address"

    fill_in "Location Name", with: "Googleplex"
    fill_in "forecast_location[address]", with: "1600 Amphitheatre Parkway in Mountain View, California"

    click_button "Add Location"

    expect(page).to have_content("Googleplex")
  end

  it "allows a user to add current location" do
    visit locations_path
    click_link "Add Your Current Location"

    fill_in "Location Name", with: "Office"

    click_button "Add Location"

    expect(page).to have_content("Office")
  end

  it "allows a user to view a saved location's forecast" do
    location = ForecastLocation.create!(name: "Code the Dream", latitude: 35.9956523, longitude: -78.902181)

    visit locations_path
    click_link "View", href: forecast_location_path(location)

    expect(page).to have_content("Weather Forecast for Code the Dream")
    expect(page).to have_css("img")
  end
end
