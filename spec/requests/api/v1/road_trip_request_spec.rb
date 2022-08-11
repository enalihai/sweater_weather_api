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
      api_key: user.api_key
    }
    
    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    expect(response).to be_successful
    expect(response).to have_http_status 200
  end
end
