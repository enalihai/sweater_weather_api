# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeoForecast do
  describe 'returns only needed data' do
    before :each do
      @data = {
        "lat": 35.4676,
        "lon": -97.4368,
        "timezone": 'America/Chicago',
        "timezone_offset": -18_000,
        "current": {
          "dt": 1_660_116_112,
          "sunrise": 1_660_131_915,
          "sunset": 1_660_181_103,
          "temp": 75,
          "feels_like": 76.15,
          "pressure": 1017,
          "humidity": 84,
          "dew_point": 69.84,
          "uvi": 0,
          "clouds": 20,
          "visibility": 10_000,
          "wind_speed": 4.61,
          "wind_deg": 220,
          "weather": [
            {
              "id": 801,
              "main": 'Clouds',
              "description": 'few clouds',
              "icon": '02n'
            }
          ]
        },
        "hourly": [
          {
            "dt": 1_660_114_800,
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
            ],
            "pop": 0.31
          }
        ],
        "daily": [
          {
            "dt": 1_659_981_600,
            "sunrise": 1_659_959_020,
            "sunset": 1_660_008_429,
            "moonrise": 1_659_999_480,
            "moonset": 1_659_943_740,
            "moon_phase": 0.37,
            "temp": {
              "day": 96.22,
              "min": 75.11,
              "max": 101.68,
              "night": 79.75,
              "eve": 96.3,
              "morn": 80.92
            },
            "feels_like": {
              "day": 97.56,
              "night": 79.75,
              "eve": 96.76,
              "morn": 83.39
            },
            "pressure": 1013,
            "humidity": 33,
            "dew_point": 62.46,
            "wind_speed": 19.01,
            "wind_deg": 159,
            "wind_gust": 31.16,
            "weather": [
              {
                "id": 500,
                "main": 'Rain',
                "description": 'light rain',
                "icon": '10d'
              }
            ],
            "clouds": 47,
            "pop": 0.86,
            "rain": 0.94,
            "uvi": 6.73
          }
        ]
      }
      @geo_forecast = GeoForecast.new(@data)
    end

    it 'includes specific Current Forecast data' do
      expect(@geo_forecast).to be_a GeoForecast
      expect(@geo_forecast.current_forecast).to be_a Hash
      expect(@geo_forecast.current_forecast).to have_key :dt
      expect(@geo_forecast.current_forecast).to have_key :sunrise
      expect(@geo_forecast.current_forecast).to have_key :sunset
      expect(@geo_forecast.current_forecast).to have_key :temp
      expect(@geo_forecast.current_forecast).to have_key :feels_like
      expect(@geo_forecast.current_forecast).to have_key :humidity
      expect(@geo_forecast.current_forecast).to have_key :uvi
      expect(@geo_forecast.current_forecast).to have_key :visibility
      expect(@geo_forecast.current_forecast[:weather][0]).to have_key :description
      expect(@geo_forecast.current_forecast[:weather][0]).to have_key :icon
    end

    it 'includes specific Daily Forecast data' do
      expect(@geo_forecast.daily_forecast).to be_a Array

      @geo_forecast.daily_forecast.each do |d|
        expect(d).to be_a Hash
        expect(d).to have_key :dt
        expect(d).to have_key :sunrise
        expect(d).to have_key :sunset
        expect(d).to have_key :temp
        expect(d[:temp]).to have_key :max
        expect(d[:temp]).to have_key :min
        expect(d[:weather][0]).to have_key :description
        expect(d[:weather][0]).to have_key :icon
      end
    end

    it 'includes specific Hourly Weather Data' do
      expect(@geo_forecast.hourly_forecast).to be_a Array

      @geo_forecast.hourly_forecast.each do |h|
        expect(h).to be_a Hash
        expect(h).to have_key :dt
        expect(h).to have_key :temp
        expect(h[:weather][0]).to have_key :description
        expect(h[:weather][0]).to have_key :icon
      end
    end

    it 'removes uncalled for Forecast Data' do
    end
  end
end
