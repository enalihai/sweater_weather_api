require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'self.create_trip' do
    road_trip = RoadTripFacade.create_trip('Denver,CO', 'Estes Park,CO')
    
    expect(road_trip).to be_a RoadTrip
  end
end