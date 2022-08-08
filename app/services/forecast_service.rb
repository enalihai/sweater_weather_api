class ForecastService
  def self.get_forecast_data(coords)
    response = conn.get("/data/2.5/onecall/?lat=#{coords[0]}&lon=#{coords[1]}") do |f|
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