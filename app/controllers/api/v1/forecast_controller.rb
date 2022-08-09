class Api::V1::ForecastController < ApplicationController
  def index
    coords = LocationFacade.get_location_coords(params[:location])
    forecast = ForecastFacade.find_outlook_by_coords(coords.lat, coords.lon)
  
    render json: ForecastSerializer.outlook_forecast(forecast), status: 201
  end
end