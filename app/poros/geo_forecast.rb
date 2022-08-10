# frozen_string_literal: true

class GeoForecast
  attr_reader :current_forecast,
              :hourly_forecast,
              :daily_forecast,
              :current_weather,
              :daily_weather,
              :hourly_weather,
              :start_city

  def initialize(data)
    @current_forecast = current_weather(data[:current])
    @hourly_forecast = hourly_weather(data[:hourly])
    @daily_forecast = daily_weather(data[:daily])
  end

  def self.start_city(data)
    data[:timezone].partition('/').last
  end
    
  def current_weather(data)
    {
    datetime: Time.at(data[:dt]),
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

  def hourly_weather(data)
    data.map do |hour|
      {
      time: Time.at(hour[:dt]).strftime('%T'),
      temperature: hour[:temp],
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon]
      }
    end
  end

  def daily_weather(data)
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
