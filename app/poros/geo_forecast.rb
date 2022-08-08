class GeoForecast
  attr_reader :current_outlook,
              :hourly_outlook,
              :daily_outlook,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(data)
    @current_outlook = CurrentForecast.new(data[:current])
    @hourly_outlook = HourlyForecast.new(data[:hourly])
    @daily_outlook = DailyForecast.new(data[:daily])
  end
end