class ForecastService
  def self.get_forecast_data(lat, lon)
    response = conn.get('/data/2.5/onecall') do |f|
      f.params[:lat] = lat
      f.params[:lon] = lon
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