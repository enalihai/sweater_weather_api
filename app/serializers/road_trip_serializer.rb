class RoadTripSerializer
  def self.serialize_trip(planned_trip)
    {
      "data": {
        "id": nil,
        'type': 'roadtrip',
        'attributes': {
          'start_city': planned_trip.start_city.first,
          'end_city': planned_trip.end_city,
          'travel_time': planned_trip.travel_time,
          'weather_at_eta': {
            'temperature': planned_trip.temperature,
            'conditions': planned_trip.conditions
          }
        }
      }
    }
  end
end