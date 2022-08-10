require 'rails_helper'

RSpec.describe 'RoadTrip Request', type: :request do
  describe 'POST /api/v1/road_trip' do
    it 'returns success', :vcr do
      header = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      body = {
        origin: 'Denver, CO',
        destination: 'Estes Park, CO',
        api_key: "38d5a8a3f0c180f50a188024db53a1cce7cdb197490a35f9753e79"
      }
      
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response).to have_http_status 200
    end
  end
end
