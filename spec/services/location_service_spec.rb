require 'rails_helper'

RSpec.describe LocationService do
  # use mapquest api, but going to use mock / stubbing  for most of my api requests
  it 'uses MapQuest API to return a coordinate' do
    mapquest_query = {
      key: ENV['mapquest_api_key'],
      location: 'nashville,tn'
    }
    nashville_response = File.read('spec/fixtures/nashville_mapquest_response.json')

    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address")
      .with(query: mapquest_query)
      .to_return(status: 200, body: nashville_response, headers: {})
    
    response = LocationService.get_coords('nashville,tn')

    expect(response).to be_a Hash
  end 
end 