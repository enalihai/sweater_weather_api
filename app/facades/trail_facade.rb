class TrailFacade
  def self.find_trails_by_city(quantity, city)
    trails = TrailService.get_trail_data(quantity, city)
    trail_array = trails[:trails].map do |trail|
      Trail.new(trail)
    end
  end
end