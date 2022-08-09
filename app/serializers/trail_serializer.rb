class TrailSerializer
  def self.trail_info(forecast, trails)
    binding.pry
    {
      "data": {
        "id": nil,
        "type": "traills",
        "attributes": {
          "city": forecast.city
          "forecast": {
            "summary": forecast.conditions,
            "temperature":  forecast.temperature
          },
          "trails": trails.map do |trail|
            {
              "id": trail.id,
              "trail_name": trail.trail_name,
              "difficulty": trail.difficulty,
              "parking": trail.parking,
              "loops": trail.loops
                # "1": {
                #   "name": "Main",
                #   "distance": ".75",
                #   "steps": 1584
                # }
              }
            }
          end
        }
      }
  end
end