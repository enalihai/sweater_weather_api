# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :confirm_password

      def create
        user = User.create!(email: params[:email], password: params[:password])

        render json: UserSerializer.serialize_user(user), status: 201
      end

      private

      def confirm_password
        if params[:password] != params[:password_confirmation]
          render json: { data: { error: 'registration', message: 'password and confirmation must match!' } },
                 status: 404
        end
      end

      # def validate_email
      #   email = params[:email]
      #   if User.find_by(email: params[:email])
      #     render json: {data{error: 'invalid', message: 'Email is already registered!'}}
      # end
    end
  end
end
