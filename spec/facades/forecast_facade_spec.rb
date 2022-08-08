require 'rails_helper'

RSpec.describe ForecastFacade do
  before :each do
    @data = [
      {:providedLocation=>{:location=>"Pueblo,CO"},
       :locations=>[
        {:street=>"",
            :adminArea6=>"",
            :adminArea6Type=>"Neighborhood",
            :adminArea5=>"Pueblo",
            :adminArea5Type=>"City",
            :adminArea4=>"Pueblo County",
            :adminArea4Type=>"County",
            :adminArea3=>"CO",
            :adminArea3Type=>"State",
            :adminArea1=>"US",
            :adminArea1Type=>"Country",
            :postalCode=>"",
            :geocodeQualityCode=>"A5XAX",
            :geocodeQuality=>"CITY",
            :dragPoint=>false,
            :sideOfStreet=>"N",
            :linkId=>"282040865",
            :unknownInput=>"",
            :type=>"s",
            :latLng=>{:lat=>38.265425, :lng=>-104.610415},
            :displayLatLng=>{:lat=>38.265425, :lng=>-104.610415},
            :mapUrl=>
              "http://www.mapquestapi.com/staticmap/v5/map?"},
            {:street=>"",
              :adminArea6=>"",
              :adminArea6Type=>"Neighborhood",
              :adminArea5=>"",
              :adminArea5Type=>"City",
              :adminArea4=>"Pueblo County",
              :adminArea4Type=>"County",
              :adminArea3=>"CO",
              :adminArea3Type=>"State",
              :adminArea1=>"US",
              :adminArea1Type=>"Country",
              :postalCode=>"",
              :geocodeQualityCode=>"A4XAX",
              :geocodeQuality=>"COUNTY",
              :dragPoint=>false,
              :sideOfStreet=>"N",
              :linkId=>"282932014",
              :unknownInput=>"",
              :type=>"s",
              :latLng=>{:lat=>38.265425, :lng=>-104.610415},
              :displayLatLng=>{:lat=>38.265425, :lng=>-104.610415},
              :mapUrl=>
                "http://www.mapquestapi.com/staticmap/v5/map?key=ERsN8MepXYCIcFKsTwHRDP5muyWI5wPJ&type=map&size=225,160&locations=38.265425,-104.610415%7Cmarker-sm-50318A-2
                &scalebar=true&zoom=9&rand=280884538"}]}]
  end
  
  it '.find_outlook(city)', :vcr do
    forecast = ForecastFacade.find_outlook(@data)
    expect(forecast).to be_a GeoForecast
  end
end 
