# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Request' do
  it 'POST /api/v1/users : posts user to db' do
    headers = {'content_type'=>'application/json', 'Accept'=>'application/json'}
    new_user = {
      'email': 'somenewuser@email.com',
      'password': 'abc123',
      'password_confirmation': 'abc123'
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(new_user)

    expect(response).to be_successful
    expect(response).to have_http_status 201

    post_outcome = JSON.parse(response.body, symbolize_names: true)

    expect(post_outcome).to have_key :data
    expect(post_outcome[:data]).to be_a Hash

    expect(post_outcome[:data]).to have_key :type
    expect(post_outcome[:data][:type]).to eq 'users'
    
    expect(post_outcome[:data]).to have_key :id
    expect(post_outcome[:data][:id]).to be_a String

    expect(post_outcome[:data]).to have_key :attributes
    expect(post_outcome[:data][:attributes]).to be_a Hash

    expect(post_outcome[:data][:attributes]).to have_key :email
    # expect(post_outcome[:data][:attributes][:email]).to be_a String

    expect(post_outcome[:data][:attributes]).to have_key :api_key
    # expect(post_outcome[:data][:attributes][:api_key]).to be_a String
  end
end
