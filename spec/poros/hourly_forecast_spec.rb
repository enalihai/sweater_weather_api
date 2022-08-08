# require 'rails_helper'

# RSpec.describe HourlyForecast do
#   it 'can create a forecast for hourly outlook' do
#     hourly_data =  {"hourly": [
#         {
#             "dt": 1659985200,
#             "temp": 81.64,
#             "feels_like": 83.43,
#             "pressure": 1015,
#             "humidity": 57,
#             "dew_point": 64.94,
#             "uvi": 10.53,
#             "clouds": 0,
#             "visibility": 10000,
#             "wind_speed": 8.28,
#             "wind_deg": 124,
#             "wind_gust": 7.14,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "pop": 0.08
#         },
#         {
#             "dt": 1659988800,
#             "temp": 82.38,
#             "feels_like": 83.68,
#             "pressure": 1015,
#             "humidity": 53,
#             "dew_point": 63.54,
#             "uvi": 9.8,
#             "clouds": 2,
#             "visibility": 10000,
#             "wind_speed": 10.16,
#             "wind_deg": 121,
#             "wind_gust": 8.37,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "pop": 0.17
#         },
#         {
#             "dt": 1659992400,
#             "temp": 83.8,
#             "feels_like": 84.49,
#             "pressure": 1014,
#             "humidity": 48,
#             "dew_point": 62.04,
#             "uvi": 7.85,
#             "clouds": 4,
#             "visibility": 10000,
#             "wind_speed": 10.69,
#             "wind_deg": 108,
#             "wind_gust": 8.81,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "pop": 0.17
#         },
#         {
#             "dt": 1659996000,
#             "temp": 85.37,
#             "feels_like": 85.33,
#             "pressure": 1013,
#             "humidity": 43,
#             "dew_point": 60.35,
#             "uvi": 5.37,
#             "clouds": 5,
#             "visibility": 10000,
#             "wind_speed": 12.21,
#             "wind_deg": 117,
#             "wind_gust": 11.01,
#             "weather": [
#                 {
#                     "id": 800,
#                     "main": "Clear",
#                     "description": "clear sky",
#                     "icon": "01d"
#                 }
#             ],
#             "pop": 0.17
#         },
#         {
#             "dt": 1659999600,
#             "temp": 86.83,
#             "feels_like": 85.77,
#             "pressure": 1012,
#             "humidity": 37,
#             "dew_point": 57.45,
#             "uvi": 2.9,
#             "clouds": 12,
#             "visibility": 10000,
#             "wind_speed": 12.68,
#             "wind_deg": 110,
#             "wind_gust": 11.18,
#             "weather": [
#                 {
#                     "id": 801,
#                     "main": "Clouds",
#                     "description": "few clouds",
#                     "icon": "02d"
#                 }
#             ],
#             "pop": 0.23
#         },
#         {
#             "dt": 1660003200,
#             "temp": 87.93,
#             "feels_like": 86,
#             "pressure": 1012,
#             "humidity": 32,
#             "dew_point": 53.83,
#             "uvi": 1.12,
#             "clouds": 14,
#             "visibility": 10000,
#             "wind_speed": 11.5,
#             "wind_deg": 129,
#             "wind_gust": 11.79,
#             "weather": [
#                 {
#                     "id": 801,
#                     "main": "Clouds",
#                     "description": "few clouds",
#                     "icon": "02d"
#                 }
#             ],
#             "pop": 0.21
#         },
#         {
#             "dt": 1660006800,
#             "temp": 86.59,
#             "feels_like": 84.78,
#             "pressure": 1011,
#             "humidity": 33,
#             "dew_point": 53.74,
#             "uvi": 0.22,
#             "clouds": 59,
#             "visibility": 10000,
#             "wind_speed": 10.54,
#             "wind_deg": 135,
#             "wind_gust": 12.01,
#             "weather": [
#                 {
#                     "id": 803,
#                     "main": "Clouds",
#                     "description": "broken clouds",
#                     "icon": "04d"
#                 }
#             ],
#             "pop": 0.28
#         },
#         {
#             "dt": 1660010400,
#             "temp": 81.64,
#             "feels_like": 81.16,
#             "pressure": 1012,
#             "humidity": 40,
#             "dew_point": 54.19,
#             "uvi": 0,
#             "clouds": 36,
#             "visibility": 10000,
#             "wind_speed": 9.1,
#             "wind_deg": 181,
#             "wind_gust": 11.81,
#             "weather": [
#                 {
#                     "id": 802,
#                     "main": "Clouds",
#                     "description": "scattered clouds",
#                     "icon": "03d"
#                 }
#             ],
#             "pop": 0.25
#         }]}

#     hf = HourlyForecast.new(hourly_data[:hourly])

#     expect(hf).to be_a HourlyForecast
#     expect(hf.time).to be_a String
#     expect(hf.temperature).to be_a Float
#     expect(hf.conditions).to be_a String
#     expect(hf.icon).to be_a String
#   end
# end