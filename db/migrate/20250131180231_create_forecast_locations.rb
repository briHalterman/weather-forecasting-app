class CreateForecastLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :forecast_locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
