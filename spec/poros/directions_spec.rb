require 'rails_helper'

RSpec.describe Directions do
  it 'returns an array of directions' do
    data = File.read('spec/fixtures/json_mocks/ny2la_directions.json')
    parsed_route = JSON.parse(data, symbolize_names: true)
  
    route = Directions.new(parsed_route)

    expect(route).to be_a Directions
    # binding.pry
  end
  it 'checks the input for an impossible route'
end