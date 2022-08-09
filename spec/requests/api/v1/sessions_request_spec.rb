require 'rails_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  describe 'GET /index' do
    it 'can create a new session for a user', :vcr do
      user = User.create!(email: 'user_spec@email.com', 
                          password: 'password', 
                          password_confirmation: 'password')
      headers = { 'CONTENT_TYPE'=>'application/json', 
                  'Accept'=>'application/json'
                }
      session_test = {
        'email': 'user_spec@email.com',
        'password': 'password'
      }

      post '/api/v1/sessions', headers: headers, params: session_test.to_json
      session = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status 200

      expect(session[:data]).to_not have_key :error
      expect(session[:data]).to_not have_key :message

      expect(session).to have_key :data
      expect(session[:data]).to be_a Hash
      
      expect(session[:data]).to have_key :type
      expect(session[:data][:type]).to eq 'users'

      expect(session[:data]).to have_key :id 
      expect(session[:data][:id]).to be_a Integer 
      
      expect(session[:data]).to have_key :attributes 
      expect(session[:data][:attributes]).to be_a Hash
      
      expect(session[:data][:attributes]).to have_key :email
      expect(session[:data][:attributes][:email]).to be_a String
      
      expect(session[:data][:attributes]).to have_key :api_key
      expect(session[:data][:attributes][:api_key]).to be_a String

      expect(session[:data][:attributes]).to_not have_key :password
    end

    it 'returns error for invalid user credentials', :vcr do
      user = User.create!(email: 'user_spec@email.com', 
                          password: 'password', 
                          password_confirmation: 'password')
      headers = { 'CONTENT_TYPE'=>'application/json', 
                  'Accept'=>'application/json'
                }
      session_test = {
        'email': 'user_spec@email.com',
        'password': 'invalid'
      }

      post '/api/v1/sessions', headers: headers, params: session_test.to_json
      session = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status 401

      expect(session).to have_key :data
      expect(session[:data]).to be_a Hash
      
      expect(session[:data]).to have_key :error
      expect(session[:data][:error]).to eq 'login'

      expect(session[:data]).to have_key :message
      expect(session[:data][:message]).to eq 'invalid credentials' 
      
      expect(session[:data]).to_not have_key :type
      expect(session[:data]).to_not have_key :id
      expect(session[:data]).to_not have_key :attributes
    end
  end
end
