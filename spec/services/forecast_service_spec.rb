require 'rails_helper'

RSpec.describe ForecastService do
  it 'returns a forecast', :vcr do
    # nashville_response = File.read('spec/fixtures/nashville_openweather_response.json')

    # stub_request(:get, "https://api.openweathermap.org/data/2.5/onecall/?appid=f57e28372b23bcdc9e27700bd3fdd29a&exclude=minutely&lat=36.166687&lon=-86.779932&units=imperial")
    #   .to_return(status: 200, body: nashville_response, headers: {})

    coords = {:lat=>36.166687, :lon=>-86.779932}
    response = ForecastService.get_forecast_data(coords)

    expect(response).to be_a Hash
    expect(response).to have_key :current
    expect(response).to have_key :hourly
    expect(response).to have_key :daily
    expect(response).to_not have_key :minutely
  end
end 