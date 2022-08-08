class Api::V1::ForecastController < ApplicationController
  before_action :confirm_coords_input 
  
  def index
    outlook = ForecastFacade.find_outlook(@location)

    render json: ForecastSerializer.outlook_forecast(outlook)
  end

  private

  def confirm_coords_input
    if params[:lat].present? && params[:lon].present?
      @location = params[:lat],params[:lon]
    else
      return render_not_found
    end
  end
end