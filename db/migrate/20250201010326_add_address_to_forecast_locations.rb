class AddAddressToForecastLocations < ActiveRecord::Migration[8.0]
  def change
    add_column :forecast_locations, :address, :string
  end
end
