require 'rails_helper'

RSpec.describe ForecastFacade do
  before :each do
    location = File.read('spec/fixtures/nashville_mapquest_response.json')
    weather = File.read('spec/fixtures/nashville_openweather_response.json')
    
    stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address?key=gQyWSGUUeYuG3YUeZt1jQT3kKciCMuN9&location=nashville,tn")
      .with(
        headers: 
          {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.4.0'
              })
      .to_return(status: 200, body: location, headers: {})
    
    stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall/?appid=f57e28372b23bcdc9e27700bd3fdd29a&exclude=minutely&lat=36.166687&lon=-86.779932&units=imperial")
      .with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.4.0'
           })
      .to_return(status: 200, body: weather, headers: {})
  end
  
  describe 'class methods' do 
    it '.find_outlook(city)' do
      forecast = ForecastFacade.find_outlook('nashville,tn')

      expect(forecast).to be_a GeoForecast
    end
  end 
end 