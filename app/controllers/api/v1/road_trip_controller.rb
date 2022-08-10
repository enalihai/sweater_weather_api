class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    
    if user.present?
      planned_trip = RoadTripFacade.create_trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.serialize_trip(planned_trip)
    else
      render json: {data: { error: 'api_key', message: 'invalid api_key'}}, status: 401
    end
  end
end
