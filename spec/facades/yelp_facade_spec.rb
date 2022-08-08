require 'rails_helper'

RSpec.describe YelpFacade do
  it 'returns a an object for serialization', :vcr do
    search = 'chinese'
    location = 'pueblo,co'

    yelp_search = YelpService.search_for_business(search, location)
    expect(yelp_search).to be_a Hash
  end
end