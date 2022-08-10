# frozen_string_literal: true

class LocationFacade
  def self.get_location_coords(city)
    data = LocationService.get_coords(city)

    if data[:info][:statuscode] == 400
      { data: { error: 'invalid', message: 'no lat/lon for that location!' } }
    else
      Coordinate.new(data)
    end
  end

  def self.get_directions(start_city, end_city)
    location_service = LocationService.directions(start_city, end_city)
    
    Directions.new(location_service)
  end
end
