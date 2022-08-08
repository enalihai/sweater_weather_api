class GeoForecast
  attr_reader :current_forecast,
              :hourly_forecast,
              :daily_forecast

  def initialize(data)

    @current_forecast = current_forecast(data[:current_weather])
    @hourly_forecast = hourly_forecast(data[:hourly_weather])
    @daily_forecast = daily_forecast(data[:daily_weather])
  end

  def self.current_forecast(data)
    {
    datetime: Time.at(data[:dt]),
    sunrise: Time.at(data[:sunrise]),
    sunset: Time.at(data[:sunset]),
    temperature: data[:temp],
    feels_like: data[:feels_like],
    humidity: data[:humidity],
    uvi: data[:uvi],
    visibility: data[:visibility],
    conditions: data[:weather].first[:description],
    icon: data[:weather][0][:icon]
    }
  end

  def self.daily_forecast(data)
    data.map do |d|
      {
        date: Time.at(d[:dt]).strftime('%F'),
        sunrise: Time.at(d[:sunrise]),
        sunset: Time.at(d[:sunset]),
        conditions: d[:weather][0][:description],
        max_temp: d[:temp][:max],
        min_temp: d[:temp][:min]
      }
    end 
  end

  def self.hourly_forecast(data)
    data.map do |h|
        {
        time: Time.at(h[:dt]).strftime('%T'),
        temperature: h[:temp].to_f,
        conditions: h[:weather][0][:description]
        }
    end
  end
end