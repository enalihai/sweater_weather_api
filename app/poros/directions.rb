class Directions
  attr_reader :travel_time,
              :directions,
              :mapped_out

  def initialize(data)
    @travel_time = data[:route][:formattedTime]
    @directions = validate_directions(data)
    @mapped_out = map_directions
  end

  def validate_directions(data)
    if data[:route][:routeError][:errorCode] == 2
      return "Impossible Route"
    else
      return data[:route][:legs][0][:maneuvers]
    end
  end

  def map_directions
    if @directions == "Impossible Route"
      return @directions
    else
      @directions.map {|direction| direction[:narrative]}
    end
  end
end