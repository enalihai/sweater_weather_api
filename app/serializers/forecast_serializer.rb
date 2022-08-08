class ForecastSerializer
  def self.outlook_forecast(outlook)
    {
      'data':
      {
        'id': nil,
        'type': 'forecast',
        'attributes':
        {
           "current_outlook":
            {
            'datetime': outlook.current_outlook[:datetime],
            'sunrise': outlook.current_outlook[:sunrise],
            'sunset': outlook.current_outlook[:sunset],
            'temperature': outlook.current_outlook[:temperature],
            'feels_like': outlook.current_outlook[:feels_like],
            'humidity': outlook.current_outlook[:humidity],
            'uvi': outlook.current_outlook[:uvi],
            'visibility': outlook.current_outlook[:visibility],
            'conditions': outlook.current_outlook[:conditions],
            'icon': outlook.current_outlook[:icon]
            },
          'daily_outlook': outlook.daily_outlook.map do |d|
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
          'hourly_outlook': outlook.hourly_outlook.first(8).map do |h|
            {
              'time': h[:time],
              'temperature': h[:temperature],
              'conditions': h[:conditions],
              'icon': h[:icon]
            }
          end
        },
      },
    }
  end
end