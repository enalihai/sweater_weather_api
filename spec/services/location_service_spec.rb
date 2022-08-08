require 'rails_helper'

RSpec.describe LocationService do
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
    expect(response).to have_key :results
    expect(response[:results]).to be_a Array

    expect(response[:results][0]).to have_key :locations
    expect(response[:results][0][:locations]).to be_a Array
    expect(response[:results][0][:locations][0]).to have_key :latLng
    
    expect(response[:results][0][:locations][0][:latLng]).to have_key :lat
    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a Float

    expect(response[:results][0][:locations][0][:latLng]).to have_key :lng
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a Float

    expect(response[:results][0][:locations][0][:latLng]).to eq({:lat=>36.166687, :lng=>-86.779932}) 
  end 
end 