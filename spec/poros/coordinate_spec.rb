require 'rails_helper'

RSpec.describe Coordinate do
  it 'can use a hash from the facade/service pattern as data' do
    data = {
      "info": {
              "statuscode": 0,
              "copyright": {},
              "messages": []
            },
      "options": {},
      "results": [
       {
        "locations": [
            {"latLng": 
                {"lat": 36.166687, "lng": -86.779932}
            }]}]}

    coords = Coordinate.new(data)

    expect(data).to be_a Hash
    expect(coords).to be_a Coordinate
    
    expect(coords.lat).to be_a Float
    expect(coords.lat).to eq 36.166687
    
    expect(coords.lon).to be_a Float
    expect(coords.lon).to eq -86.779932
  end 
end