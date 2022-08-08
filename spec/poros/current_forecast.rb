require 'rails_helper'

RSpec.describe CurrentForecast do
  it 'can create a forecast for current outlook' do
    current_data =  {"current": {
        "dt": 1659981570,
        "sunrise": 1659960422,
        "sunset": 1660010470,
        "temp": 78.46,
        "feels_like": 79.25,
        "pressure": 1013,
        "humidity": 69,
        "dew_point": 67.44,
        "uvi": 9.8,
        "clouds": 17,
        "visibility": 10000,
        "wind_speed": 5.01,
        "wind_deg": 154,
        "wind_gust": 7,
        "weather": [
            {
                "id": 801,
                "main": "Clouds",
                "description": "few clouds",
                "icon": "02d"
            }
        ]
    }}

    cf = CurrentForecast.new(current_data)

    expect(cf).to be_a CurrentForecast
    expect(cf.datetime).to 
  end
end