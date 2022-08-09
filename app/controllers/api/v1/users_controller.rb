# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        if params[:password] == params[:password_confirmation]
          user = User.create!(email: params[:email], password: params[:password])

          render json: UserSerializer.serialize_user(user), status: 201
        else
          render json: { error: 'registration', message: 'invalid user attribtues' }, status: 404
        end
      end
    end
  end
end
