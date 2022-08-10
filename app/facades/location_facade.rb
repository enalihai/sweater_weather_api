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

    # if location_service[:route].first == location_service[:route][:routeError] 
    #   render json: {data: {error: 'no location', message: 'missing a location!'}}, status: 404
    # else
    Directions.new(location_service[:route])
    # end
  end
end
