# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeoForecast do
  describe 'returns only needed data' do
    it 'includes specific Current Forecast data' do
      weather = File.read('spec/fixtures/json_mocks/nash_weather.json')
      parsed_weather = JSON.parse(weather, symbolize_names: true)
  
      geo_forecast = GeoForecast.new(parsed_weather)

      expect(geo_forecast).to be_a GeoForecast

      expect(geo_forecast.datetime).to be_a String
      expect(geo_forecast.sunrise).to be_a String
      expect(geo_forecast.sunset).to be_a String
      expect(geo_forecast.temperature).to be_a Numeric
      expect(geo_forecast.feels_like).to be_a Numeric
      expect(geo_forecast.humidity).to be_a Numeric
      expect(geo_forecast.uvi).to be_a Numeric
      expect(geo_forecast.visibility).to be_a Numeric
      expect(geo_forecast.conditions).to be_a String
      expect(geo_forecast.icon).to be_a String

      expect(geo_forecast.daily).to be_a Array

      geo_forecast.daily.each do |d|
        expect(d).to be_a Hash
        expect(d).to have_key :date
        
        expect(d).to have_key :sunrise
        expect(d[:sunrise]).to be_a String
        
        expect(d).to have_key :sunset
        expect(d[:sunset]).to be_a String
        
        expect(d).to have_key :max_temp
        expect(d[:max_temp]).to be_a Numeric
        
        expect(d).to have_key :min_temp
        expect(d[:min_temp]).to be_a Numeric
        
        expect(d).to have_key :conditions
        expect(d[:conditions]).to be_a String
        
        expect(d).to have_key :icon
        expect(d[:icon]).to be_a String
      end

      expect(geo_forecast.hourly).to be_a Array

      geo_forecast.hourly.each do |h|
        expect(h).to be_a Hash
        expect(h).to have_key :time

        expect(h).to have_key :temperature
        expect(h[:temperature]).to be_a Numeric
        
        expect(h).to have_key :conditions
        expect(h[:conditions]).to be_a String

        expect(h).to have_key :icon
        expect(h[:icon]).to be_a String 
      end
    end
  end
end
