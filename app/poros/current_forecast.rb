# class CurrentForecast
#   attr_reader :summary, 
#               :temperature,
#               :datetime,
#               :sunrise,
#               :sunset,
#               :feels_like,
#               :humidity,
#               :uvi,
#               :visibility,
#               :icons

#   def initialize(data)
#     binding.pry
#     @datetime = data[:current][:dt]
#     @sunrise = data[:current][:sunrise]
#     @sunset = data[:current][:sunset]
#     @temperature = data[:current][:temp]
#     @feels_like = data[:current][:feels_like]
#     @humidity = data[:current][:humidity]
#     @uvi = data[:current][:uvi]
#     @visibility = data[:current][:visibility]
#     @conditions = data[:current][:weather][0][:description]
#     @icon = data[:current][:weather][0][:icon]
#   end
# end