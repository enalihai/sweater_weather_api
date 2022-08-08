class DailyForecast
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:hourly][:dt])
    @temperature = data[:hourly][:temp]
    @conditions = data[:hourly][:weather][:description]
    @icon = data[:hourly][:weather][:icon]
  end
end