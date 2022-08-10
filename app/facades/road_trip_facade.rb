class RoadTripFacade
  def self.create_trip(start_city, end_city)
    directions = LocationFacade.get_directions(start_city, end_city)
    coords = LocationFacade.get_location_coords(end_city)
    outlook = ForecastFacade.find_outlook_by_coords(coords.lat, coords.lon)

    RoadTrip.new(directions, outlook)
  end
end