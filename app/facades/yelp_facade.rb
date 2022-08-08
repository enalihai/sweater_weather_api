class YelpFacade
  def self.engage_with_munchy(munchy_search, munchy_location)
    pmd = Array.new #pottential munchy deets = pmd
    
    destination = LocationFacade.get_location_coords(munchy_location)
    munchy_deets = YelpService.search_for_business(munchy_search, munchy_location)
    forecast = ForecastFacade.find_outlook(destination)

    pmd << destination
    pmd << munchy_deets
    pmd << forecast

    MunchayaSerializer.serialize_input(pmd)
  end
end