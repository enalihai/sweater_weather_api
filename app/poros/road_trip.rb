require 'time'

class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(directions, outlook)
    @start_city = directions.start_city
    @end_city = directions.end_city
    @travel_time = directions.travel_time
    @temperature = outlook.temperature
    @conditions = outlook.conditions
  end  
end
# my weather def isnt going to the right day.
# def destination_forecast(directions)
#   total_hours = total_duration(directions)[0..1].to_i > 48
  
#   if total_hours > 48
#     render json: {data: { error: 'impossible route'}}
#   else
#     @conditions
#   end
# end

