require 'rails_helper'

RSpec.describe 'RoadTripFacade' do
  xit 'self.create_trip', :vcr do# need to give it real data..... 
    road_trip = RoadTripFacade.create_trip('Denver,CO', 'Estes Park,CO')
    
    expect(road_trip).to be_a RoadTrip
  end
end