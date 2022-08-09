
module Api
  module V1
    class TrailsController < ApplicationController
      def index
        binding.pry
        coords = LocationFacade.get_location_coords(params[:city])
        forecast = ForecastFacade.find_outlook_by_coords(coords.lat, coords.lon)

      end
    end
  end
end