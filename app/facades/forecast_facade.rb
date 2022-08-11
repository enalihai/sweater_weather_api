# frozen_string_literal: true

class ForecastFacade
  def self.find_outlook_by_coords(lat, lon)
    outlook = ForecastService.get_forecast_data(lat, lon)

    if outlook[:cod] == 400
      render json: { data: { error: nil, message: 'input is cannot be nil' } }, status: 400
    else
      GeoForecast.new(outlook)
    end
  end
end
