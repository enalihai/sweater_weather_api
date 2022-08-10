require 'time'

class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions,
              :total_duration

  def initialize(directions, outlook)
    # @start_city = outlook[-1]
    @end_city = directions[:route][:legs].last[:destNarrative]
    @travel_time = total_duration(directions)[0..1].to_i
    @temperature = outlook.hourly_forecast["#{@total_hours}".to_i][:temperature]
    @conditions = outlook.hourly_forecast["#{@total_hours}".to_i][:conditions]
    @total_hours = total_duration(directions)[0..1].to_i + 1
  end

  def total_duration(directions)
    binding.pry
    time_array = directions[:route][:legs][0][:maneuvers].map do |direction| 
      direction[:formattedTime]
    end 

    sum_array = time_array.map do |t|
      hour, minute = t.split(':')
      minns = hour.to_i * 60 + minute.to_i
    end

    total_mins = sum_array.sum
    mins = total_mins.to_i % 60
    hours = total_mins.to_i / 60

    "#{hours} hours and #{mins} minutes"
  end
end

  # def destination_forecast(directions)
  #   total_hours = total_duration(directions)[0..1].to_i > 48
    
  #   if total_hours > 48
  #     render json: {data: { error: 'impossible route'}}
  #   else
  #     @conditions
  #   end
  # end
