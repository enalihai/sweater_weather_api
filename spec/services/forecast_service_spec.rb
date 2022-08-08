require 'rails_helper'

RSpec.describe ForecastService do
  it 'returns a forecast', :vcr do
    data = {
      "info": {
        "statuscode": 0,
        "copyright": {
            "text": "© 2022 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "imageAltText": "© 2022 MapQuest, Inc."
             },
    "messages": []
  },
  "options": {
    "maxResults": -1,
    "thumbMaps": true,
    "ignoreLatLngInput": false
  },
  "results": [
    {
      "providedLocation": {
        "location": "nashville,tn"
      },
      "locations": [
        {
          "street": "",
          "adminArea6": "",
          "adminArea6Type": "Neighborhood",
          "adminArea5": "Nashville",
          "adminArea5Type": "City",
          "adminArea4": "Davidson County",
          "adminArea4Type": "County",
          "adminArea3": "TN",
          "adminArea3Type": "State",
          "adminArea1": "US",
          "adminArea1Type": "Country",
          "postalCode": "",
          "geocodeQualityCode": "A5XAX",
          "geocodeQuality": "CITY",
          "dragPoint": false,
          "sideOfStreet": "N",
          "linkId": "282087490",
          "unknownInput": "",
          "type": "s",
          "latLng": {
            "lat": 36.166687,
            "lng": -86.779932
          },
          "displayLatLng": {
            "lat": 36.166687,
            "lng": -86.779932
          },
          "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=gQyWSGUUeYuG3YUeZt1jQT3kKciCMuN9&type=map&size=225,160&locations=36.166687,-86.779932|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-525488344"
        }
      ]
    }
  ]
}
    response = ForecastService.get_forecast_data(data)

    expect(response).to be_a Hash
  
    expect(response).to have_key :current
    expect(response).to have_key :hourly
    expect(response).to have_key :daily
    expect(response).to_not have_key :minutely
  end
end 