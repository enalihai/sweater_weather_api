class Directions
  attr_reader :directions,
              :travel_time,
              :start_city,
              :end_city,
              :mapped_out

  def initialize(data)
    @directions = validate_directions(data)
    @travel_time = data[:route][:formattedTime]
    @start_city = data[:route][:locations][0][:adminArea5]
    @end_city = data[:route][:locations][1][:adminArea5]
    @mapped_out = map_directions
  end

  def validate_directions(data)
    if data[:route][:routeError][:errorCode] == 2
      return {data: {error: 'bad route', message: "Thats an Impossible Route you got there friend"}}, status: 404
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