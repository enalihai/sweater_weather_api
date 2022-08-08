class GeoForecast
  attr_reader :current_outlook,
              :hourly_outlook,
              :daily_outlook

  def initialize(data)
    @current_outlook = CurrentForecast.new(data[:current])
    @hourly_outlook = HourlyForecast.new(data[:hourly])
    @daily_outlook = DailyForecast.new(data[:daily])
  end
end