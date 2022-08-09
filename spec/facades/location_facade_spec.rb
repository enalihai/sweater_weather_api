# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Location Facade' do
  it 'parses data for a lat/lon coords', :vcr do
    coords = LocationFacade.get_location_coords('nashville,tn')

    expect(coords).to be_a Coordinate
    expect(coords.lat).to be_a Float
    expect(coords.lon).to be_a Float

    expect(coords).to_not respond_to :info
    expect(coords).to_not respond_to :options
    expect(coords).to_not respond_to :results
    expect(coords).to_not respond_to :locations
    expect(coords).to_not respond_to :displayLatLng
  end
end
