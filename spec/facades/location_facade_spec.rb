require 'rails_helper'

RSpec.describe 'Location Facade' do
  it 'returns :lat :lng', :vcr do
    # latLng = File.read('spec/fixtures/nashville_mapquest_response.json')
    # stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=gQyWSGUUeYuG3YUeZt1jQT3kKciCMuN9&location=nashville,tn")
    #   .to_return(status: 200, body: latLng, headers: {})
    
    coords = LocationFacade.get_location_coords('nashville,tn')

    expect(coords.lat).to be_a Float
    expect(coords.lon).to be_a Float

    expect(coords).to_not respond_to :info
    expect(coords).to_not respond_to :options
    expect(coords).to_not respond_to :results
    expect(coords).to_not respond_to :locations
    expect(coords).to_not respond_to :displayLatLng
  end
end