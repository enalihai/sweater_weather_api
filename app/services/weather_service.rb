class WeatherService
  def self.get_forecast_data(coords)
    response = conn.get('/data/3.0/onecall/') do |f|
      f.params[:lat] = coords[:lat]
      f.params[:lon] = coords[:lng]
      f.params[:units] = 'imperial'
      f.params[:exclude] = 'minutely'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org') do |f|
      f.params[:appid] = ENV['openweather_api_key']
    end
  end
end