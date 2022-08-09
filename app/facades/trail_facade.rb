class TrailFacade
  def self.find_trails_by_city(quantity, city)
    trails = TrailService.get_trail_data(quantity, city)
    Trail.new(trails)
  end
end