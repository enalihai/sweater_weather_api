class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      render json: UserSerializer.serialize_user(user), status: 200
    else
      render json: { data: { error: 'login', message: 'invalid credentials' } }, status: 401
    end
  end
end
