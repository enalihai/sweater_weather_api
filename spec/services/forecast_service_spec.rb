# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ForecastService do
  it 'returns a forecast', :vcr do
    lat = 39.738453
    lon = -104.984853
    response = ForecastService.get_forecast_data(lat, lon)

    expect(response).to be_a Hash
    expect(response).to have_key :current
    expect(response).to have_key :hourly
    expect(response).to have_key :daily
    expect(response).to_not have_key :minutely
  end
end
