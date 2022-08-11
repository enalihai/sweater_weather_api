# frozen_string_literal: true

require 'time'

class ForecastSerializer
  def self.outlook_forecast(outlook)
    {
      'data': {
        'id': nil,
        'type': 'forecast',
        'attributes': {
          "current_weather": {
            'datetime': outlook.datetime,
            'sunrise': outlook.sunrise,
            'sunset': outlook.sunset,
            'temperature': outlook.temperature,
            'feels_like': outlook.feels_like,
            'humidity': outlook.humidity,
            'uvi': outlook.uvi,
            'visibility': outlook.visibility,
            'conditions': outlook.conditions,
            'icon': outlook.icon
          },
          'daily_weather': outlook.daily.map do |d|
            {
              'date': d[:date],
              'sunrise': d[:sunrise],
              'sunset': d[:sunset],
              'max_temp': d[:max_temp],
              'min_temp': d[:min_temp],
              'conditions': d[:conditions],
              'icon': d[:icon]
            }
          end,
          'hourly_weather': outlook.hourly.first(48).map do |h|
            {
              'time': h[:time],
              'temperature': h[:temperature],
              'conditions': h[:conditions],
              'icon': h[:icon]
            }
          end
        }
      }
    }
  end
end
