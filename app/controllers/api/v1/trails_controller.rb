
module Api
  module V1
    class TrailsController < ApplicationController
      def index
        coords = LocationFacade.get_location_coords(params[:city])
        forecast = ForecastFacade.find_outlook_by_coords(coords.lat, coords.lon)

        render json: TrailFacade.find_trails_by_city(params[:quantity], params[:city])
      end
    end
  end
end