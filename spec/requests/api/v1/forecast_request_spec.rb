# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forecast Request' do
  describe 'GET /api/v1/forecast?location=?' do
    it 'returns [:data] with keys [id,type,attributes]', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      location = 'miami,fl'

      get '/api/v1/forecast', headers: headers, params: { location: location }

      expect(response).to be_successful
      expect(response).to have_http_status 200

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to have_key :data
      expect(forecast[:data]).to be_a Hash

      expect(forecast[:data]).to have_key :id
      expect(forecast[:data][:id]).to be_nil

      expect(forecast[:data]).to have_key :type
      expect(forecast[:data][:type]).to eq 'forecast'

      expect(forecast[:data]).to have_key :attributes
      expect(forecast[:data][:attributes]).to be_a Hash
    end

    it 'returns attributes via OpenWeather API', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      location = 'miami,fl'

      get '/api/v1/forecast', headers: headers, params: { location: location }

      openweather_api = JSON.parse(response.body, symbolize_names: true)

      expect(openweather_api[:data][:attributes]).to have_key :current_weather
      expect(openweather_api[:data][:attributes]).to be_a Hash

      current_weather = openweather_api[:data][:attributes][:current_weather]

      expect(current_weather).to have_key :datetime
      expect(current_weather[:datetime]).to be_a String

      expect(current_weather).to have_key :sunrise
      expect(current_weather[:sunrise]).to be_a String

      expect(current_weather).to have_key :sunset
      expect(current_weather[:sunset]).to be_a String

      expect(current_weather).to have_key :temperature
      expect(current_weather[:temperature]).to be_a Float

      expect(current_weather).to have_key :feels_like
      expect(current_weather[:feels_like]).to be_a Float

      expect(current_weather).to have_key :humidity
      expect(current_weather[:humidity]).is_a? Numeric

      expect(current_weather).to have_key :uvi
      expect(current_weather[:uvi]).is_a? Numeric

      expect(current_weather).to have_key :visibility
      expect(current_weather[:visibility]).is_a? Numeric

      expect(current_weather).to have_key :conditions
      expect(current_weather[:conditions]).to be_a String

      expect(current_weather).to have_key :icon
      expect(current_weather[:icon]).to be_a String
    end

    it 'returns Daily Weather data', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      location = 'miami,fl'

      get '/api/v1/forecast', headers: headers, params: { location: location }

      daily = JSON.parse(response.body, symbolize_names: true)

      daily_weather = daily[:data][:attributes][:daily_weather]

      expect(daily_weather).to be_a Array
      expect(daily_weather.count).to eq 8

      daily_weather.each do |day|
        expect(day).to be_a Hash

        expect(day).to have_key :date
        expect(day[:date]).to be_a String

        expect(day).to have_key :sunrise
        expect(day[:sunrise]).to be_a String

        expect(day).to have_key :sunset
        expect(day[:sunset]).to be_a String

        expect(day).to have_key :max_temp
        expect(day[:max_temp]).to be_a Float

        expect(day).to have_key :min_temp
        expect(day[:min_temp]).to be_a Float

        expect(day).to have_key :conditions
        expect(day[:conditions]).to be_a String

        expect(day).to have_key :icon
        expect(day[:icon]).to be_a String
      end
    end

    it 'returns Hourly Weather data', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      location = 'miami,fl'

      get '/api/v1/forecast', headers: headers, params: { location: location }

      hourly = JSON.parse(response.body, symbolize_names: true)

      hourly_weather = hourly[:data][:attributes][:hourly_weather]

      expect(hourly_weather).to be_a Array
      expect(hourly_weather.count).to eq 48

      hourly_weather.each do |hour|
        expect(hour).to have_key :time
        expect(hour[:time]).to be_a String

        expect(hour).to have_key :temperature
        expect(hour[:temperature]).to be_a Numeric

        expect(hour).to have_key :conditions
        expect(hour[:conditions]).to be_a String

        expect(hour).to have_key :icon
        expect(hour[:icon]).to be_a String
      end
    end
  end

  describe '#EDGECASE / Sad Path' do
   xit 'returns an error for nil query', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      get '/api/v1/forecast', headers: headers, params: nil

      expect(response).to_not be_successful
      expect(response).to have_http_status 400
    end
  end
end
