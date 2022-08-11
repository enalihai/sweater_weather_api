require 'rails_helper'

RSpec.describe RoadTrip do
  it 'takes information from multiple endpoints as a hash' do
    weather = File.read('spec/fixtures/json_mocks/nash_weather.json')
    directions = File.read('spec/fixtures/json_mocks/ny2la_directions.json')
    
    parsed_weather = JSON.parse(weather, symbolize_names: true)
    parsed_directions = JSON.parse(directions, symbolize_names: true)
    
    outlook = GeoForecast.new(parsed_weather)
    directions = Directions.new(parsed_directions)
    
    created_trip = RoadTrip.new(directions, outlook)

    expect(created_trip).to be_a RoadTrip
    expect(created_trip.conditions).to be_a String
    expect(created_trip.end_city).to be_a String
    expect(created_trip.start_city).to be_a String
    expect(created_trip.temperature).to be_a Numeric
    expect(created_trip.travel_time).to be_a String
  end
end


    # expect(created_trip[:data]).to have_key :id
    # expect(created_trip[:data][:id]).to be_nil

    # expect(created_trip[:data]).to have_key :type
    # expect(created_trip[:data][:type]).to eq 'roadtrip'

    # expect(created_trip[:data]).to have_key :attributes
    # expect(created_trip[:data][:attributes]).to be_a Hash

    # expect(created_trip[:data][:attributes]).to have_key :start_city
    # expect(created_trip[:data][:attributes][:start_city]).to be_a String

    # expect(created_trip[:data][:attributes]).to have_key :end_city
    # expect(created_trip[:data][:attributes][:end_city]).to be_a String
    
    # trip_hash = created_trip[:data][:attributes]

    # expect(trip_hash).to have_key :travel_time
    # expect(trip_hash[:travel_time]).to be_a String

    # expect(trip_hash).to have_key :weather_at_eta
    # expect(trip_hash[:weather_at_eta]).to be_a Hash

    # expect(trip_hash).to have_key :temperature
    # expect(trip_hash[:temperature]).to be_a Numeric
    
    # expect(trip_hash).to have_key :conditions
    # expect(trip_hash[:conditiona]).to be_a String