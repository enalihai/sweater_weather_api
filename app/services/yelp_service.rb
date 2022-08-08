class YelpService
  def self.search_for_business(search, location)
    response = conn.get("/v3/businesses/search?term=#{search}&location=#{location}") do |f|
      f.headers['Authorization'] = ENV['yelp_api_key']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.yelp.com')
  end
end