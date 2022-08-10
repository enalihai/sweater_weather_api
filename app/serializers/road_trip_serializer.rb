class RoadTripSerializer
  def self.serialize_trip(directions, weather)
    {
      "data": {
        "id": nil,
        'type': 'roadtrip',
        'attributes': {
          'start_city': directions.start_city,
          'end_city': directions.end_city,
          'travel_time': directions.travel_time,
          'weather_at_eta': {
            'temperature': weather.temperature,
            'conditions': weather.conditions
          }
        }
      }
    }
  end
end