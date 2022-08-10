require 'rails_helper'

RSpec.describe 'RoadTrip Request', type: :request do
  describe 'POST /api/v1/road_trip' do
    it 'returns success' do
      header = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      body = {
        origin: 'Denver, CO',
        destination: 'Estes Park, CO',
        api_key: 'dd1a97da73aeb24b989ed3a6130725bb519eab95b495d7f9d436b2'
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response).to have_http_status 200
      # add the rest of the tests when you get there
    end
  end
end
