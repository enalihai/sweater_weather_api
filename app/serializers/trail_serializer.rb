class TrailSerializer
  def self.trail_info(forecast, trails)
    {
      "data": 
      {
        "id": nil,
        "type": "trails",
        "attributes": 
        {
          "city": forecast[:dt],
          "forecast": 
            {
            "summary": forecast[:weather][0][:description],
            "temperature":  forecast[:temp]
          },
          "trails": trails.map do |trail|
            {
              "id": trail.id,
              "trail_name": trail.trail_name,
              "difficulty": trail.difficulty,
              "parking": trail.parking,
              "loops": trail.loops.each do |loop_specs|
                {
                  "name": loop_specs[1][:name],
                  "distance": loop_specs[1][:distance],
                  "steps": loop_specs[1][:steps]
                }
              end
              }
          end
        }
      }
    }
  end
end