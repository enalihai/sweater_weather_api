require 'rails_helper'

RSpec.describe 'Forecast Request' do
  describe 'GET /api/v1/forecast?location=?' do
    before :each do
      get '/api/v1/forecast?location=denver,co'

      @response = JSON.parse(response.body, symbolize_names: true)
    end

    it 'returns [:data] with keys [id,type,attributes]' do
      expect(@response).to be_successful
      expect(@response).to have_http_status 200
      
      expect(@response).to have_key :data
      expect(@response[:data]).to be_a Hash

      expect(@response[:data]).to have_key :id
      expect(@response[:data][:id]).to be_nil
      
      expect(@response[:data]).to have_key :type
      expect(@response[:data][:type]).to eq 'forecast'

      expect(@response[:data]).to have_key :attributes
      expect(@response[:data][:attributes]).to be_a Hash
    end 

    it 'returns attributes via OpenWeather API' do
      expect(@response[:data][:attributes]).to have_key :current_weather
      expect(@response[:data][:attributes]).to be_a Hash
    end

    it 'returns Current Weather data' do
      current_weather = @response[:data][:attributes][:current_weather]
      
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
      expect(current_weather[:humidity]).to be_a Float || Integer

      expect(current_weather).to have_key :uvi
      expect(current_weather[:uvi]).to be_a Float || Integer

      expect(current_weather).to have_key :visibility
      expect(current_weather[:visibility]).to be_a Float || Integer

      expect(current_weather).to have_key :conditions
      expect(current_weather[:conditions]).to be_a String

      expect(current_weather).to have_key :icon
      expect(current_weather[:icon]).to be_a String
    end

    it 'returns Daily Weather data' do
      daily_weather = @response[:data][:attributes][:daily_weather]

      expect(daily_weather).to be_a Array
      expect(daily_weather.count).to eq 5
    
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

    it 'returns Hourly Weather data' do
      hourly_weather = @response[:data][:attributes][:hourly_weather]

      expect(hourly_weather).to be_a Array
      expect(hourly_weather.count).to eq 8

      hourly_weather.each do |hour|
        expect(hour).to have_key :time
        expect(hour[:time]).to be_a String
        
        expect(hour).to have_key :temperature
        expect(hour[:temperature]).to be_a Float
        # check to see if imperial

        expect(hour).to have_key :conditions
        expect(hour[:conditions]).to be_a String

        expect(hour).to have_key :icon
        expect(hour[:icon]).to be_a String
      end
    end
  end

  describe '#EDGECASE / Sad Path' do
    it 'pairs down the Mapquest request'
    # fill in test during Poro creation
    it 'pairs down the OpenWeather request'
    # to not include minutely / alerts
    # fill in test during Poro creation
    it 'returns error for invalid format'

    it 'returns error when location input is invalid'
    # figure out how to break Mapquest geocoding
    it 'returns error when weather input is invalid'
    # figure out how to break OpenWeather API
  end
end