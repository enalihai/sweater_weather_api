# frozen_string_literal: true

class GeoForecast
  attr_reader :current_forecast,
              :hourly_forecast,
              :daily_forecast

  def initialize(data)
    @current_forecast = data[:current]
    @hourly_forecast = data[:hourly]
    @daily_forecast = data[:daily]
  end
end

# def self.output
#   make a method that pairs down the information given to the serializer
# end

# def self.current_weather(current_forecast)
#   binding.pry
#   {
#   datetime: Time.at(data[:dt]),
#   sunrise: Time.at(data[:sunrise]),
#   sunset: Time.at(data[:sunset]),
#   temperature: data[:temp],
#   feels_like: data[:feels_like],
#   humidity: data[:humidity],
#   uvi: data[:uvi],
#   visibility: data[:visibility],
#   conditions: data[:weather].first[:description],
#   icon: data[:weather][0][:icon]
#   }
# end

# def self.daily_weather(@daily_forecast)
#   data.map do |d|
#     binding.pry
#     {
#       date: Time.at(d[:dt]).strftime('%F'),
#       sunrise: Time.at(d[:sunrise]),
#       sunset: Time.at(d[:sunset]),
#       max_temp: d[:temp][:max],
#       min_temp: d[:temp][:min],
#       conditions: d[:weather][0][:description],
#       icon: day[:weather][0][:icon]
#     }
#   end
# end

# def self.hourly_weather(@hourly_forecast)
#   data.map do |h|
#     binding.pry
#       {
#       time: Time.at(h[:dt]).strftime('%T'),
#       temperature: h[:temp].to_f,
#       conditions: h[:weather][0][:description],
#       icon: h[:weather][:icon]
#     }
#   end
# end

# def self.current_weather(data)
#   {
#   datetime: Time.at(data[:dt].strftime('%D')),
#   sunrise: Time.at(data[:sunrise]),
#   sunset: Time.at(data[:sunset]),
#   temperature: data[:temp],
#   feels_like: data[:feels_like],
#   humidity: data[:humidity],
#   uvi: data[:uvi],
#   visibility: data[:visibility],
#   conditions: data[:weather][0][:description],
#   icon: data[:weather][0][:icon]
#   }
# end

# def self.hourly_weather(data)
#   data.map do |hour|
#     {
#     time: Time.at(hour[:dt]),
#     temperature: hour[:temp],
#     conditions: hour[:weather][:description],
#     icon: hour[:weather][:icon]
#     }
#   end
# end

# def self.daily_weather(data)
#   data.map do |day|
#     {
#     date: Time.at(day[:dt]).strftime('%D'),
#     sunrise: Time.at(day[:sunrise]),
#     sunset: Time.at(day[:sunset]),
#     max_temp: day[:temp][:max],
#     min_temp: day[:temp][:min],
#     conditions: day[:weather][0][:description],
#     icon: day[:weather][0][:icon]
#     }
#   end
# end
