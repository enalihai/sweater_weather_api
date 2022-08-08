class DailyForecast
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt])
    @temperature = data[:temp]
    @conditions = data[:weather][:description]
    @icon = data[:weather][:icon]
  end
end