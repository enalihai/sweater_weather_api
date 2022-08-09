require 'rails_helper'

RSpec.describe 'Trail Service' do
  it 'uses Prescription Trails API for nearby trails' do
    response = TrailService.get_trail_data('Albuquerque', 5)

    expect(response).to be_a Hash
    expect(response).to have_key :trails
    expect(response[:trails]).to be_a Array
    expect(response[:trails][0]).to be_a Hash
  end

  it 'has specific trail information' do
    response = TrailService.get_trail_data('Albuquerque', 5)
    trail = response[:trails]

    expect(trail).to have_key :id
    expect(trail[:id]).to be_a Integer

    expect(trail).to have_key :name
    expect(trail[:name]).to be_a String

    expect(trail).to have_key :city
    expect(trail[:city]).to be_a String

    expect(trail).to have_key :zip
    expect(trail[:zip]).to be_a Integer

    expect(trail).to have_key :crossstreets
    expect(trail[:crossstreets]).to be_a String
    
    expect(trail).to have_key :address
    expect(trail[:addresss]).to be_a String
    
    expect(trail).to have_key :transit
    expect(trail[:transit]).to be_a String

    expect(trail).to have_key :lat
    expect(trail[:lat]).to be_a String
    
    expect(trail).to have_key :lng
    expect(trail[:lng]).to be_a String

    expect(trail).to have_key :desc
    expect(trail[:desc]).to be_a String

    expect(trail).to have_key :lighting
    expect(trail[:lighting]).to be_a String

    expect(trail).to have_key :difficulty
    expect(trail[:difficulty]).to be_a Integer

    expect(trail).to have_key :surface
    expect(trail[:surface]).to be_a String

    expect(trail).to have_key :parking
    expect(trail[:parking]).to be_a String

    expect(trail).to have_key :facilities
    expect(trail[:facilities]).to be_a String

    expect(trail).to have_key :hours
    expect(trail[:hours]).to be_a String

    expect(trail).to have_key :loopcount
    expect(trail[:loopcount]).to be_a Integer

    expect(trail).to have_key :satImgURL
    expect(trail[:satImgURL]).to be_a String

    expect(trail).to have_key :largeImgURL
    expect(trail[:largeImgURL]).to be_a String
    
    expect(trail).to have_key :thumbURL
    expect(trail[:thumbURL]).to be_a String

    expect(trail).to have_key :attractions
    expect(trail[:attractions]).to be_a Array

    expect(trail).to have_key :loops
    expect(trail[:loops]).to be_a Hash

    expect(trail).to have_key :published
    expect(trail[:published]).to be_a String

    expect(trail).to have_key :rating
    expect(trail[:rating]).to be_a Integer

    expect(trail).to have_key :ratings
    expect(trail[:ratings]).to be_a Integer

    expect(trail).to have_key :favorites
    expect(trail[:favorites]).to be_a Integer

    expect(trail).to have_key :ModifiedTime
    expect(trail[:ModifiedTime]).to be_a String

    expect(trail).to have_key :reviews
    expect(trail[:reviews]).to be_a Integer

    expect(trail).to have_key :distance
    expect(trail[:distance]).to be_a Float

    expect(trail).to have_key :url
    expect(trail[:url]).to be_a String
  end 
end