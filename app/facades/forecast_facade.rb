class ForecastFacade
  def self.find_outlook(location)
    coords = LocationFacade.get_location_coords(location)
    forecast = ForecastService.get_forecast_data(coords)
    binding.pry
    GeoForecast.new(forecast)
  end
end