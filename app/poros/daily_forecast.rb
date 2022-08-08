class DailyForecast
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = data[:daily][:dt]
    @temperature = data[:daily][:temp]
    @conditions = data[:daily][:weather][:description]
    @icon = data[:daily][:weather][:icon]
  end
end