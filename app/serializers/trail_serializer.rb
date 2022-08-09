class TrailSerializer
  def self.trail_info(data)
    {
      "data": {
        "id": nil,
        "type": "traills",
        "attributes": {
          "forecast": {
            "summary": forecast.conditions,
            "temperature":  forecast.temperature
          },
          "trails": [
            {
              "id": trail.id,
              "trail_name": trail.trail_name,
              "difficulty": trail.difficulty,
              "parking": "On street",
              "loops": {
                "1": {
                  "name": "Main",
                  "distance": ".75",
                  "steps": 1584
                }
              }
            }
          ]
        }
      }
    }
  end
end