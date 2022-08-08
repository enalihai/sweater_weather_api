require 'rails_helper'

RSpec.describe YelpFacade do
  it 'returns a an object for serialization', :vcr do
    search = 'chinese'
    location = 'pueblo,co'

    yelp_search = YelpService.search_for_business(search, location)
    expect(yelp_search).to be_a Hash
    expect(yelp_search).to have_key :businesses
    expect(yelp_search[:businesses][0]).to have_key :name
    expect(yelp_search[:businesses][0]).to have_key :location

    business_location = yelp_search[:businesses][0][:location]
    expect(business_location).to have_key :address_1
    expect(business_location).to have_key :address_2
    expect(business_location).to have_key :city
    expect(business_location).to have_key :state
    expect(business_location).to have_key :zip_code
  end
end