# frozen_string_literal: true

class GeoForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :hourly,
              :daily

  def initialize(data)
    @datetime = Time.at(data[:current][:dt]).strftime('%T')
    @sunrise = Time.at(data[:current][:sunrise]).strftime('%T')
    @sunset = Time.at(data[:current][:sunset]).strftime('%T')
    @temperature = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @conditions = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
    @hourly = hourly_weather(data)
    @daily = daily_weather(data)
  end

  def hourly_weather(data)
    data[:hourly].map do |h|
      {
      time: Time.at(h[:dt]).strftime('%T'),
      temperature: h[:temp],
      conditions: h[:weather][0][:description],
      icon: h[:weather][0][:icon]
      }
    end
  end

  def daily_weather(data)
    data[:daily].map do |d|
      {
      date: Time.at(d[:dt]),
      sunrise: Time.at(d[:sunrise]).strftime('%T'),
      sunset: Time.at(d[:sunset]).strftime('%T'),
      max_temp: d[:temp][:max],
      min_temp: d[:temp][:min],
      conditions: d[:weather][0][:description],
      icon: d[:weather][0][:icon]
      }
    end
  end
end

  # def self.start_city(data)
  #   data[:timezone].partition('/').last
  # end
  # embarrassed when i found where the start and end cities were nested 