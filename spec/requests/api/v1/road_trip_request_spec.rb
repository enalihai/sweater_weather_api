require 'rails_helper'

RSpec.describe 'RoadTrip Request', type: :request do
  it 'POST /api/v1/road_trip', :vcr do
    user = User.create!(
                  email: 'testter@google.com',
                  password: 'password',
                  password_confirmation: 'password'    
                )
                
    header = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    body = {
      origin: 'Denver, CO',
      destination: 'Estes Park, CO',
      api_key: '9470cfc2c648049e7bc6dd743f04e09d80a6c12f'
    }
    
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    expect(response).to be_successful
    expect(response).to have_http_status 200
  end

  it 'makes sure password matches password_conf', :vcr do
    user = User.create!(
                  email: 'testter@google.com',
                  password: 'password',
                  password_confirmation: 'updog'    
                )
                
    header = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    body = {
      origin: 'Denver, CO',
      destination: 'Estes Park, CO',
      api_key: '9470cfc2c648049e7bc6dd743f04e09d80a6c12f'
    }
    
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    expect(response).to be_successful
    expect(response).to have_http_status 200
  end

  it 'makes sure user has a valid API key', :vcr do
    user = User.create(
                  email: 'testter@google.com',
                  password: 'password',
                  password_confirmation: 'password'    
                )
                
    header = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
    body = {
      origin: 'Denver, CO',
      destination: 'Estes Park, CO',
      api_key: 'invalid'
    }
    
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    expect(response).to_not be_successful
    expect(response).to have_http_status 401
  end
end
