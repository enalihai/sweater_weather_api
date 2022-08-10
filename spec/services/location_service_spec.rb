# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationService do
  it 'uses MapQuest API to return a coordinate' do
    response = LocationService.get_coords('nashville,tn')

    expect(response).to be_a Hash
    expect(response).to have_key :results
    expect(response[:results]).to be_a Array

    expect(response[:results][0]).to have_key :locations
    expect(response[:results][0][:locations]).to be_a Array
    expect(response[:results][0][:locations][0]).to have_key :latLng

    expect(response[:results][0][:locations][0][:latLng]).to have_key :lat
    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a Float

    expect(response[:results][0][:locations][0][:latLng]).to have_key :lng
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a Float

    expect(response[:results][0][:locations][0][:latLng]).to eq({ lat: 36.166687, lng: -86.779932 })
  end

  it 'uses MapQuest API to return a coordinate' do
    response = LocationService.directions('Denver,CO', 'Estes Park,CO')
    
    expect(response).to be_a Hash
    expect(response).to have_key :route
    expect(response[:route]).to be_a Hash

  #   expect(response[:results][0]).to have_key :locations
  #   expect(response[:results][0][:locations]).to be_a Array
  #   expect(response[:results][0][:locations][0]).to have_key :latLng

  #   expect(response[:results][0][:locations][0][:latLng]).to have_key :lat
  #   expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a Float

  #   expect(response[:results][0][:locations][0][:latLng]).to have_key :lng
  #   expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a Float

  #   expect(response[:results][0][:locations][0][:latLng]).to eq({ lat: 36.166687, lng: -86.779932 })
  end
end
