require 'rails_helper'

RSpec.describe MunchayaSerializer do
  it 'has attributes' do
    pmd = [] #fill with factory bot data if you have time
    muncharino = MunchayaSerializer.serialize_input(pmd)
  
    expect(muncharino).to have_key :data
    expect(muncharino[:data]).to be_a Hash

    expect(muncharino[:data].count).to eq 3
    expect(muncharino[:data][:id]).to be_nil
    expect(muncharino[:data][:type]).to eq 'munchie'
  
    expect(muncharino[:data][:attributes]).to have_key :destination_city

    expect(muncharino[:data][:attributes]).to have_key :forecast
    expect(muncharino[:data][:attributes][:forecast]).to have_key :summary
    expect(muncharino[:data][:attributes][:forecast]).to have_key :temperature

    expect(muncharino[:data][:attributes]).to have_key :restaurant
    expect(muncharino[:data][:attributes][:restaurant]).to have_key :name
    expect(muncharino[:data][:attributes][:restaurant]).to have_key :address    
  end
end