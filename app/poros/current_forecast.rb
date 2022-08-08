class CurrentForecast
  attr_reader :summary, 
              :temperature,
              :datetime,
              :sunrise,
              :sunset,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :icons

  def initialize(data)
    @datetime = Time.at(data[:dt].strftime('%D'))
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @temperature = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end