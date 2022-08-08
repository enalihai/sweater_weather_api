class Api::V1::YelpController < ApplicationController
  def index
    munchies = YelpFacade.engage_with_munchy(params[:search], params[:location])

    render json: MunchayaSerializer.serialize_input(munchies)
  end
end