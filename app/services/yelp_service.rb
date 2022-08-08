class YelpService
  def self.search_yelp(search, arrival, location)
    response = conn.get("/businesses/search?location=#{location}") do |f|
      f.headers['Authorization'] = ENV['yelp_api_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('')
  end
end