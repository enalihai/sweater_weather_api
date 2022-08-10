# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        coords = LocationFacade.get_location_coords(params[:location])
        forecast = ForecastFacade.find_outlook_by_coords(coords.lat, coords.lon)
      
        if forecast.nil?
          render json: { data: { error: 'forecast', message: forecast.message } }, status: 404
        else
          render json: ForecastSerializer.outlook_forecast(forecast), status: 200
        end
      end
    end
  end
end
