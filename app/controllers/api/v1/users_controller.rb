# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        if params[:password] == params[:password_confirmation]
          user = User.create!(email: params[:email], password: params[:password])
          
          render json: UserSerializer.create_user(user), status: 201
        else
          render json: {error: 'user', message: 'could not create user'}, status: 404
        end
      end
    end
  end
end