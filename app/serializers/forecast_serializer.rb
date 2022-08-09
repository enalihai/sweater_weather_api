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
             'datetime': Time.at(outlook.current_forecast[:dt]),
             'sunrise': Time.at(outlook.current_forecast[:sunrise]),
             'sunset': Time.at(outlook.current_forecast[:sunset]),
             'temperature': outlook.current_forecast[:temp],
             'feels_like': outlook.current_forecast[:feels_like],
             'humidity': outlook.current_forecast[:humidity],
             'uvi': outlook.current_forecast[:uvi],
             'visibility': outlook.current_forecast[:visibility],
             'conditions': outlook.current_forecast[:weather][0][:description],
             'icon': outlook.current_forecast[:weather][0][:icon]
           },
          'daily_weather': outlook.daily_forecast.map do |d|
                             {
                               'date': Time.at(d[:dt]),
                               'sunrise': Time.at(d[:sunrise]),
                               'sunset': Time.at(d[:sunset]),
                               'max_temp': d[:temp][:max],
                               'min_temp': d[:temp][:min],
                               'conditions': d[:weather][0][:description],
                               'icon': d[:weather][0][:icon]
                             }
                           end,
          'hourly_weather': outlook.hourly_forecast.first(8).map do |h|
                              {
                                'time': Time.at(h[:dt]),
                                'temperature': h[:temp],
                                'conditions': h[:weather][0][:description],
                                'icon': h[:weather][0][:icon]
                              }
                            end
        }
      }
    }
  end
end
