require 'rails_helper'

RSpec.describe WeatherService do
  it 'returns a forecast' do
    nashville_response = File.read('spec/fixtures/nashville_openweather_response.json')

    stub_request(:get, "https://api.openweathermap.org/data/3.0/onecall/?appid=f57e28372b23bcdc9e27700bd3fdd29a&exclude=minutely&lat=36.166687&lon=-86.779932&units=imperial")
      .with(headers: {
       	        'Accept'=>'*/*',
       	        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	        'User-Agent'=>'Faraday v2.4.0'
            })
      .to_return(status: 200, body: nashville_response, headers: {})

    response = WeatherService.get_forecast_data({lat: 36.166687, lng: -86.779932})

    expect(response).to be_a Hash
    expect(response).to have_key :current
    expect(response).to have_key :hourly
    expect(response).to have_key :daily
    expect(response).to_not have_key :minutely

    # add tests for each of the keys for current, daily, hourly
  end
end 