require 'time'

class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(directions, outlook)
    @start_city = directions.directions.first[:streets]
    @end_city = directions.directions.last[:narrative]
    @travel_time = total_duration(directions)
    @temperature = outlook.hourly_forecast[2][:temp]
    @conditions = outlook.hourly_forecast[2][:weather][0][:description]
  end

  def total_duration(directions)
   time_array = directions.directions.map {|direction| direction[:time]} 
   sum = time_array.sum
   Time.at(sum).strftime("%H:%M:%S")
  end
end