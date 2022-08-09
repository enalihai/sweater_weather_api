class TrailFacade
  def self.find_trails_by_city(quantity, city)
    trails = TrailService.get_trail_data(quantity, city)
    SomeNewPoro.new(trails)
  end
end