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
    expect(business_location).to eq({:address1=>"1620 S Prairie Ave", :address2=>nil, :address3=>nil, :city=>"Pueblo", :country=>"US", :display_address=>["1620 S Prairie Ave", "Pueblo, CO 81005"], :state=>"CO", :zip_code=>"81005"})
  end
end