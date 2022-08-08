require 'rails_helper'

RSpec.describe YelpService do
  it 'gets a good response', :vcr do
    response = YelpService.conn
    expect(response).to be_a(Faraday::Connection)
  end
  
  it 'has data to parse in response', :vcr do
    response = YelpService.search_for_business('chinese', Time.now.to_i, "denver")
    expect(response).to be_a Hash
    expect(response).to have_key :businesses
    expect(response).to have_key :total
    expect(response).to have_key :region
  end
end