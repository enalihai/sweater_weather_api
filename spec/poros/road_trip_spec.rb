require 'rails_helper'

RSpec.describe RoadTrip do
  it 'takes information from multiple endpoints as a hash' do
    weather = [
          {
            "dt": 1660114800,
            "temp": 75,
            "feels_like": 76.15,
            "pressure": 1017,
            "humidity": 84,
            "dew_point": 69.84,
            "uvi": 0,
            "clouds": 20,
            "visibility": 10_000,
            "wind_speed": 2.51,
            "wind_deg": 91,
            "wind_gust": 3.87,
            "weather": [
              {
                "id": 801,
                "main": 'Clouds',
                "description": 'few clouds',
                "icon": '02n'
              }
            ]
          }
        ]

    created_trip = RoadTrip.new(directions, weather)

    expect(created_trip).to be_a RoadTrip
    expect(created_trip.start_city).to eq 'Denver,CO'
    expect(created_trip.end_city).to eq 'Estes Park,CO'
    expect(created_trip.travel_time).to eq '00:42:45'
    expect(created_trip.weather).to be_a Array
  end
end