require 'rails_helper'

RSpec.describe YelpService do
  it 'gets a good response', :vcr do
    response = YelpService.conn
    expect(response).to be_successful
  end
  
  it 'has data to parse in response', :vcr do
    response = YelpsService.yelp_search('fast food', Time.now.to_i, "denver")
    expect(response).to be_a Hash
    expect(response).to have_key :photos
    expect(response).to have_key :page
    expect(response).to have_key :per_page
  end
end