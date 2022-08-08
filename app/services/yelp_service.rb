class YelpService
  def self.search_for_business(search, open, location)
    response = conn.get("/v3/businesses/search?") do |f|
      f.headers['Authorization'] = 'gx6fVZWpnGZ0TZKZ_rTchYFxGEsZ4J0ZNRNSR2GS0jnSM0BpqwM-IW534niuQLDrmE4YqOfVtjz-NJO9TBHI9KRKS1K-EcueF1wQGiKsbdMIBgkQi-ZcEmVNSSXxYnYx'
      f.
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.yelp.com')
  end
end