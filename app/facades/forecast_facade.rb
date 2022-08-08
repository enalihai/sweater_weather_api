class ForecastFacade
  def self.find_outlook(location)
    binding.pry
    forecast = ForecastService.get_forecast_data(location)
    GeoForecast.new(forecast)
  end
end