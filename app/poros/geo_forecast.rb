class GeoForecast
  attr_reader :current_outlook,
              :hourly_outlook,
              :daily_outlook,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(data)
    @current_outlook = current_weather(data[:current])
    @hourly_outlook = hourly_weather(data[:hourly])
    @daily_outlook = daily_weather(data[:daily])
  end

  def self.current_weather(data)
    {
    datetime: Time.at(data[:dt].strftime('%D')),
    sunrise: Time.at(data[:sunrise]),
    sunset: Time.at(data[:sunset]),
    temperature: data[:temp],
    feels_like: data[:feels_like],
    humidity: data[:humidity],
    uvi: data[:uvi],
    visibility: data[:visibility],
    conditions: data[:weather][0][:description],
    icon: data[:weather][0][:icon]
    }
  end

  def self.hourly_weather(data)
    data.map do |hour|
      {
      time: Time.at(hour[:dt]),
      temperature: hour[:temp],
      conditions: hour[:weather][:description],
      icon: hour[:weather][:icon]
      }
    end
  end

  def self.daily_weather(data)
    data.map do |day|
      {
      date: Time.at(day[:dt]).strftime('%D'),
      sunrise: Time.at(day[:sunrise]),
      sunset: Time.at(day[:sunset]),
      max_temp: day[:temp][:max],
      min_temp: day[:temp][:min],
      conditions: day[:weather][0][:description],
      icon: day[:weather][0][:icon]
      }
    end
  end
end