require 'rails_helper'

RSpec.describe 'Accessible-Trails Request' do
  it 'returns a json payload', :vcr do
    headers = {'CONTENT_TYPE' => 'application/json'}
    city = 'Albuquerque'
    quantity = 5

    get '/api/v1/accessible-trails', headers: headers, params: { city: city, quantity: quantity}

    expect(response).to be_successful
    expect(response).to have_http_status 200

    trails_request = JSON.parse(response.body, symbolize_names: true)

    expect(trails_request).to have_key :data
    expect(trails_request[:data]).to be_a Hash

    expect(trails_request[:data]).to have_key :id
    expect(trails_request[:data][:id]).to be_nil

    expect(trails_request[:data]).to have_key :type
    expect(trails_request[:data][:type]).to eq 'trails'

    expect(trails_request[:data]).to have_key :attributes
    expect(trails_request[:data][:attributes]).to be_a Hash
  
    
  end
end