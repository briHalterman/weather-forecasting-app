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
end
