# frozen_string_literal: true

require 'time'

class ForecastSerializer
  def self.outlook_forecast(outlook)
    {
      'data':
      {
        'id': nil,
        'type': 'forecast',
        'attributes':
          {
            "current_weather":
            {
              'datetime': outlook.current_forecast[:datetime],
              'sunrise': outlook.current_forecast[:sunrise],
              'sunset': outlook.current_forecast[:sunset],
              'temperature': outlook.current_forecast[:temperature],
              'feels_like': outlook.current_forecast[:feels_like],
              'humidity': outlook.current_forecast[:humidity],
              'uvi': outlook.current_forecast[:uvi],
              'visibility': outlook.current_forecast[:visibility],
              'conditions': outlook.current_forecast[:conditions],
              'icon': outlook.current_forecast[:icon]
            },
            'daily_weather':
                outlook.daily_forecast.map do |d|
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
            'hourly_weather':
                outlook.hourly_forecast.first(48).map do |h|
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
