class Directions
  attr_reader :travel_time,
              :directions,
              :mapped_out

  def initialize(data)
    @travel_time = data[:formattedTime]
    @directions = validate_directions(data)
    @mapped_out = map_directions
  end

  def validate_directions(data)
    if data[:routeError][:errorCode] == 2
      return "Impossible Route"
    else
      return data[:legs][0][:maneuvers]
    end
  end

  def map_directions
    if @directions == "Impossible Route"
      return @directions
    else
      route = @directions.map {|direction| direction[:narrative]}
    end
  end
end