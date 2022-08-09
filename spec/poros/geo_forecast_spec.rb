# require 'rails_helper'

# RSpec.describe GeoForecast do
#   it 'can create a new GeoForecast from a Hash' do
#     data = {
#     "lat": 35.4676,
#     "lon": -97.4368,
#     "timezone": "America/Chicago",
#     "timezone_offset": -18000,
#     "current": {
#         "dt": 1659968017,
#         "sunrise": 1659959020,
#         "sunset": 1660008429,
#         "temp": 85.33,
#         "feels_like": 88.3,
#         "pressure": 1008,
#         "humidity": 55,
#         "dew_point": 67.33,
#         "uvi": 0.52,
#         "clouds": 0,
#         "visibility": 10000,
#         "wind_speed": 11.5,
#         "wind_deg": 200,
#         "weather": [
#                 {
#           "id": 800,
#           "main": "Clear",
#           "description": "clear sky",
#           "icon": "01d"
#           }
#         ]
#     },
#     "hourly": [
#         {
#             "dt": 1659967200,
#             "temp": 85.33,
#             "feels_like": 88.3,
#             "pressure": 1008,
#             "humidity": 55,
#             "dew_point": 67.33,
#             "uvi": 0.52,
#             "clouds": 0,
#             "visibility": 10000,
#             "wind_speed": 13.13,
#             "wind_deg": 213,
#             "wind_gust": 20.11,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "pop": 0.22
#         },
#         {
#             "dt": 1659970800,
#             "temp": 86.23,
#             "feels_like": 88.84,
#             "pressure": 1010,
#             "humidity": 52,
#             "dew_point": 66.54,
#             "uvi": 1.13,
#             "clouds": 10,
#             "visibility": 10000,
#             "wind_speed": 13.44,
#             "wind_deg": 225,
#             "wind_gust": 16.42,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "pop": 0.14
#         },
#         {
#             "dt": 1659974400,
#             "temp": 88.7,
#             "feels_like": 91.11,
#             "pressure": 1011,
#             "humidity": 47,
#             "dew_point": 65.89,
#             "uvi": 2.66,
#             "clouds": 16,
#             "visibility": 10000,
#             "wind_speed": 12.75,
#             "wind_deg": 240,
#             "wind_gust": 12.48,
#             "weather": [
#                 {
#                     "id": 801,
#                     "main": "Clouds",
#                     "description": "few clouds",
#                     "icon": "02d"
#                 }
#             ],
#             "pop": 0.1
#         },
#         {
#             "dt": 1659978000,
#             "temp": 92.19,
#             "feels_like": 94.08,
#             "pressure": 1012,
#             "humidity": 40,
#             "dew_point": 64.4,
#             "uvi": 3.64,
#             "clouds": 31,
#             "visibility": 10000,
#             "wind_speed": 10.63,
#             "wind_deg": 250,
#             "wind_gust": 8.37,
#             "weather": [
#                 {
#                     "id": 802,
#                     "main": "Clouds",
#                     "description": "scattered clouds",
#                     "icon": "03d"
#                 }
#             ],
#             "pop": 0.1
#         },
#         {
#             "dt": 1659981600,
#             "temp": 96.22,
#             "feels_like": 97.56,
#             "pressure": 1013,
#             "humidity": 33,
#             "dew_point": 62.46,
#             "uvi": 4.22,
#             "clouds": 47,
#             "visibility": 10000,
#             "wind_speed": 8.3,
#             "wind_deg": 246,
#             "wind_gust": 6.6,
#             "weather": [
#                 {
#                     "id": 802,
#                     "main": "Clouds",
#                     "description": "scattered clouds",
#                     "icon": "03d"
#                 }
#             ],
#             "pop": 0.07
#         },
#         {
#             "dt": 1659985200,
#             "temp": 100.81,
#             "feels_like": 100.85,
#             "pressure": 1014,
#             "humidity": 25,
#             "dew_point": 58.91,
#             "uvi": 6.73,
#             "clouds": 100,
#             "visibility": 10000,
#             "wind_speed": 7.56,
#             "wind_deg": 231,
#             "wind_gust": 6.89,
#             "weather": [
#                 {
#                     "id": 804,
#                     "main": "Clouds",
#                     "description": "overcast clouds",
#                     "icon": "04d"
#                 }
#             ],
#             "pop": 0
#         },
#         {
#             "dt": 1659988800,
#             "temp": 101.68,
#             "feels_like": 101.64,
#             "pressure": 1013,
#             "humidity": 24,
#             "dew_point": 58.15,
#             "uvi": 5.8,
#             "clouds": 100,
#             "visibility": 10000,
#             "wind_speed": 8.48,
#             "wind_deg": 227,
#             "wind_gust": 7.49,
#             "weather": [
#                 {
#                     "id": 804,
#                     "main": "Clouds",
#                     "description": "overcast clouds",
#                     "icon": "04d"
#                 }
#             ],
#             "pop": 0
#         },
#         {
#             "dt": 1659992400,
#             "temp": 99.36,
#             "feels_like": 99.14,
#             "pressure": 1012,
#             "humidity": 26,
#             "dew_point": 58.5,
#             "uvi": 4.24,
#             "clouds": 100,
#             "visibility": 10000,
#             "wind_speed": 7.27,
#             "wind_deg": 225,
#             "wind_gust": 7.9,
#             "weather": [
#                 {
#                     "id": 804,
#                     "main": "Clouds",
#                     "description": "overcast clouds",
#                     "icon": "04d"
#                 }
#             ],
#             "pop": 0
#         }
#     ],
#     "daily": [
#         {
#             "dt": 1659981600,
#             "sunrise": 1659959020,
#             "sunset": 1660008429,
#             "moonrise": 1659999480,
#             "moonset": 1659943740,
#             "moon_phase": 0.37,
#             "temp": {
#                 "day": 96.22,
#                 "min": 75.11,
#                 "max": 101.68,
#                 "night": 79.75,
#                 "eve": 96.3,
#                 "morn": 80.92
#             },
#             "feels_like": {
#                 "day": 97.56,
#                 "night": 79.75,
#                 "eve": 96.76,
#                 "morn": 83.39
#             },
#             "pressure": 1013,
#             "humidity": 33,
#             "dew_point": 62.46,
#             "wind_speed": 19.01,
#             "wind_deg": 159,
#             "wind_gust": 31.16,
#             "weather": [
#                 {
#                     "id": 500,
#                     "main": "Rain",
#                     "description": "light rain",
#                     "icon": "10d"
#                 }
#             ],
#             "clouds": 47,
#             "pop": 0.86,
#             "rain": 0.94,
#             "uvi": 6.73
#         },
#         {
#             "dt": 1660068000,
#             "sunrise": 1660045468,
#             "sunset": 1660094767,
#             "moonrise": 1660089720,
#             "moonset": 1660033860,
#             "moon_phase": 0.41,
#             "temp": {
#                 "day": 90.52,
#                 "min": 72.28,
#                 "max": 95.86,
#                 "night": 79.47,
#                 "eve": 94.71,
#                 "morn": 72.28
#             },
#             "feels_like": {
#                 "day": 92.57,
#                 "night": 79.47,
#                 "eve": 95.59,
#                 "morn": 73.31
#             },
#             "pressure": 1015,
#             "humidity": 43,
#             "dew_point": 64.74,
#             "wind_speed": 16.46,
#             "wind_deg": 163,
#             "wind_gust": 30.6,
#             "weather": [
#                 {
#                     "id": 500,
#                     "main": "Rain",
#                     "description": "light rain",
#                     "icon": "10d"
#                 }
#             ],
#             "clouds": 96,
#             "pop": 0.99,
#             "rain": 2.53,
#             "uvi": 9.35
#         },
#         {
#             "dt": 1660154400,
#             "sunrise": 1660131915,
#             "sunset": 1660181103,
#             "moonrise": 1660179420,
#             "moonset": 1660124520,
#             "moon_phase": 0.45,
#             "temp": {
#                 "day": 95.52,
#                 "min": 70.75,
#                 "max": 100.47,
#                 "night": 84.58,
#                 "eve": 94.39,
#                 "morn": 70.75
#             },
#             "feels_like": {
#                 "day": 97.36,
#                 "night": 86.36,
#                 "eve": 95.95,
#                 "morn": 71.62
#             },
#             "pressure": 1016,
#             "humidity": 35,
#             "dew_point": 63.64,
#             "wind_speed": 13.33,
#             "wind_deg": 95,
#             "wind_gust": 24.47,
#             "weather": [
#                 {
#                     "id": 500,
#                     "main": "Rain",
#                     "description": "light rain",
#                     "icon": "10d"
#                 }
#             ],
#             "clouds": 2,
#             "pop": 0.54,
#             "rain": 2.17,
#             "uvi": 9.9
#         },
#         {
#             "dt": 1660240800,
#             "sunrise": 1660218362,
#             "sunset": 1660267439,
#             "moonrise": 1660268520,
#             "moonset": 1660215420,
#             "moon_phase": 0.5,
#             "temp": {
#                 "day": 97.12,
#                 "min": 73.96,
#                 "max": 99.32,
#                 "night": 82.62,
#                 "eve": 95.56,
#                 "morn": 73.96
#             },
#             "feels_like": {
#                 "day": 96.3,
#                 "night": 83.97,
#                 "eve": 95.22,
#                 "morn": 74.77
#             },
#             "pressure": 1016,
#             "humidity": 27,
#             "dew_point": 57.74,
#             "wind_speed": 13.73,
#             "wind_deg": 167,
#             "wind_gust": 24.92,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "clouds": 0,
#             "pop": 0.15,
#             "uvi": 10
#         },
#         {
#             "dt": 1660327200,
#             "sunrise": 1660304810,
#             "sunset": 1660353773,
#             "moonrise": 1660357140,
#             "moonset": 1660306380,
#             "moon_phase": 0.52,
#             "temp": {
#                 "day": 95.49,
#                 "min": 74.07,
#                 "max": 99.45,
#                 "night": 82.99,
#                 "eve": 93.78,
#                 "morn": 74.07
#             },
#             "feels_like": {
#                 "day": 96.84,
#                 "night": 83.71,
#                 "eve": 94.14,
#                 "morn": 74.79
#             },
#             "pressure": 1016,
#             "humidity": 34,
#             "dew_point": 62.78,
#             "wind_speed": 15.3,
#             "wind_deg": 154,
#             "wind_gust": 19.48,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "clouds": 10,
#             "pop": 0,
#             "uvi": 10
#         },
#         {
#             "dt": 1660413600,
#             "sunrise": 1660391257,
#             "sunset": 1660440106,
#             "moonrise": 1660445520,
#             "moonset": 1660397160,
#             "moon_phase": 0.56,
#             "temp": {
#                 "day": 98.69,
#                 "min": 75.83,
#                 "max": 103.39,
#                 "night": 89.22,
#                 "eve": 100.83,
#                 "morn": 75.83
#             },
#             "feels_like": {
#                 "day": 98.62,
#                 "night": 87.69,
#                 "eve": 99.43,
#                 "morn": 76.17
#             },
#             "pressure": 1014,
#             "humidity": 27,
#             "dew_point": 59.67,
#             "wind_speed": 11.88,
#             "wind_deg": 194,
#             "wind_gust": 23.09,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "clouds": 10,
#             "pop": 0,
#             "uvi": 10
#         },
#         {
#             "dt": 1660500000,
#             "sunrise": 1660477704,
#             "sunset": 1660526438,
#             "moonrise": 1660533600,
#             "moonset": 1660487760,
#             "moon_phase": 0.6,
#             "temp": {
#                 "day": 104.49,
#                 "min": 80.08,
#                 "max": 107.64,
#                 "night": 91.08,
#                 "eve": 104.74,
#                 "morn": 80.08
#             },
#             "feels_like": {
#                 "day": 104.16,
#                 "night": 88.97,
#                 "eve": 103.35,
#                 "morn": 81.07
#             },
#             "pressure": 1009,
#             "humidity": 21,
#             "dew_point": 56.53,
#             "wind_speed": 17,
#             "wind_deg": 231,
#             "wind_gust": 32.14,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "clouds": 5,
#             "pop": 0,
#             "uvi": 10
#         },
#         {
#             "dt": 1660586400,
#             "sunrise": 1660564151,
#             "sunset": 1660612769,
#             "moonrise": 1660621680,
#             "moonset": 1660578120,
#             "moon_phase": 0.64,
#             "temp": {
#                 "day": 105.15,
#                 "min": 81.48,
#                 "max": 105.17,
#                 "night": 85.84,
#                 "eve": 97.83,
#                 "morn": 81.48
#             },
#             "feels_like": {
#                 "day": 104.54,
#                 "night": 85.89,
#                 "eve": 97.32,
#                 "morn": 82.09
#             },
#             "pressure": 1007,
#             "humidity": 20,
#             "dew_point": 56.08,
#             "wind_speed": 14.54,
#             "wind_deg": 194,
#             "wind_gust": 33.98,
#             "weather": [
#                 {
#                     "id": 500,
#                     "main": "Rain",
#                     "description": "light rain",
#                     "icon": "10d"
#                 }
#             ],
#             "clouds": 70,
#             "pop": 0.3,
#             "rain": 0.19,
#             "uvi": 10
#         }
#     ]}
    
#     geo_forecast = GeoForecast.new(data)

#     expect(geo_forecast).to be_a GeoForecast
#     expect(geo_forecast.current_forecast).to be_a Hash
#     expect(geo_forecast.current_forecast).to have_key :datetime
#     expect(geo_forecast.current_forecast).to have_key :sunrise
#     expect(geo_forecast.current_forecast).to have_key :sunset
#     expect(geo_forecast.current_forecast).to have_key :temperature
#     expect(geo_forecast.current_forecast).to have_key :feels_like
#     expect(geo_forecast.current_forecast).to have_key :humidity
#     expect(geo_forecast.current_forecast).to have_key :uvi
#     expect(geo_forecast.current_forecast).to have_key :visibility
#     expect(geo_forecast.current_forecast).to have_key :conditions
#     expect(geo_forecast.current_forecast).to have_key :icon
    
#     expect(geo_forecast.daily_forecast).to be_a Array
#     geo_forecast.daily_forecast.each do |d|
#       expect(d).to be_a Hash
#       expect(d).to have_key :date
#       expect(d).to have_key :sunrise
#       expect(d).to have_key :sunset
#       expect(d).to have_key :max_temp
#       expect(d).to have_key :min_temp
#       expect(d).to have_key :conditions
#       expect(d).to have_key :icon
#     end
    
#     expect(geo_forecast.hourly_forecast).to be_a Array
#     geo_forecast.hourly_forecast.each do |h|
#       expect(h).to be_a Hash
#       expect(h).to have_key :time
#       expect(h).to have_key :temperature
#       expect(h).to have_key :conditions
#       expect(h).to have_key :icon
#     end
#   end 
# end