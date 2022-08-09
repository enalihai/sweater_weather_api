# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        if params[:pasword] == params[:password_confirmation]
          user = User.new(email: params[:email], password: params[:password])
          render json: UserSerializer.create_user(user)
        else
          render json: {error: 'user', message: 'could not create user'}, status: 404
        end
      end
    end
  end
end