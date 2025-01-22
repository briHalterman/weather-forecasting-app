# Define a class named "Location"
class Location
  # Declare class variable to store locations and initialize it to an empty array
  @@locations = []

  # Expose attributes
  attr_reader :name, :latitude, :longitude

  # Constructor to create new location
  def initialize(name = "", latitude = 0.0, longitude = 0.0)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  # Add location to in-memory storage
  def self.add(name = "", latitude = 0.0, longitude = 0.0)
    location = Location.new(name, latitude, longitude)
    @@locations << location
    location
  end

  # Return all locations
  def self.all
    @@locations
  end

  # Find location by index
  def self.find_by_index(index)
    @@locations[index]
  end

  # Methods for `form_with` compatibility
  def self.model_name
    ActiveModel::Name.new(self, nil, "Location")
  end

  def persisted?
    false
  end
end

## Test

Location.add("Tokyo", 35.6764, 139.6500)
Location.add("London", 51.5072, 0.1276)

# puts Location.all.inspect
# puts Location.find_by_index(0).inspect
