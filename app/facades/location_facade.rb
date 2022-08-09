class LocationFacade
  def self.get_location_coords(city)
    data = LocationService.get_coords(city)
    Coordinate.new(data)
  end
end