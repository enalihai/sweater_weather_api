# frozen_string_literal: true

class ForecastFacade
  def self.find_outlook_by_coords(lat, lon)
    outlook = ForecastService.get_forecast_data(lat, lon)

    if outlook[:cod] == 400
      { data: { error: nil, message: 'input is cannot be nil'}}
    else
      GeoForecast.new(outlook)
    end
  end
end
