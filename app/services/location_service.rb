# frozen_string_literal: true

class LocationService
  def self.get_coords(city)
    response = conn.get('/geocoding/v1/address') do |f|
      f.params[:location] = city
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(start_city, end_city)
    response = conn.get('/directions/v2/route') do |f|
      f.params[:from] = start_city
      f.params[:to] = end_city
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('http://www.mapquestapi.com') do |f|
      f.params[:key] = ENV['mapquest_api_key']
    end
  end
end
