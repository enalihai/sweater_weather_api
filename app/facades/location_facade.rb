class LocationFacade
  def self.get_location_coords(city)
    coords = LocationService.get_coords(city)

    Coordinate.new(coords)
  end
end