# frozen_string_literal: true

class ForecastFacade
  def self.find_outlook_by_coords(lat, lon)
    outlook = ForecastService.get_forecast_data(lat, lon)
    GeoForecast.new(outlook)
  end
end
