# Define a class named "Location"
class Location
  # Declare class variable to store locations and initialize it to an empty array
  @@locations = []

  # Construct location
  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  # Define class method to add location to locations
  def self.add(location)
    @@locations << location
  end

  # Define class to return all locations
  def self.all
    @@locations
  end
end

# ## Test

# # Create new locations
# testLocal1 = Location.new("Tokyo", 35.6764, 139.6500)
# testLocal2 = Location.new("London", 51.5072, 0.1276)

# # Add locations to the list
# Location.add(testLocal1)
# Location.add(testLocal2)

# # Print all locations
# puts Location.all.inspect