require 'rails_helper'

RSpec.describe 'GeoCode Poros' do
  describe 'initialize' do
    it 'abstracts and encapsulates geocode data that can be read' do
      # brighton_geocode_data = File.read('spec/fixtures/webmock/brighton_geocode_data.json')
      brighton_geocode_data = {
          "info": {
              "statuscode": 0,
              "copyright": {
                  "text": "© 2021 MapQuest, Inc.",
                  "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
                  "imageAltText": "© 2021 MapQuest, Inc."
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
                      "location": "brighton, co"
                  },
                  "locations": [
                      {
                          "street": "",
                          "adminArea6": "",
                          "adminArea6Type": "Neighborhood",
                          "adminArea5": "Brighton",
                          "adminArea5Type": "City",
                          "adminArea4": "Adams County",
                          "adminArea4Type": "County",
                          "adminArea3": "CO",
                          "adminArea3Type": "State",
                          "adminArea1": "US",
                          "adminArea1Type": "Country",
                          "postalCode": "",
                          "geocodeQualityCode": "A5XAX",
                          "geocodeQuality": "CITY",
                          "dragPoint": false,
                          "sideOfStreet": "N",
                          "linkId": "282039540",
                          "unknownInput": "",
                          "type": "s",
                          "latLng": {
                              "lat": 39.986767,
                              "lng": -104.812604
                          },
                          "displayLatLng": {
                              "lat": 39.986767,
                              "lng": -104.812604
                          },
                          "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ATriLusA2fkTHGtvK8O2EeJZLupbmJ8u&type=map&size=225,160&locations=39.986767,-104.812604|marker-sm-50318A-1&scalebar=true&zoom=12&rand=674427284"
                      }
                  ]
              }
          ]
      }

      # parse_json = JSON.parse(brighton_geocode_data, symbolize_names: true)
      #
      # stub_request(:get, "http://www.mapquestapi.com/geocoding/v1/address.json").
      #   to_return(status: 200, body: brighton_geocode_data, headers: {})

      brighton = Geocode.new(brighton_geocode_data)

      expect(brighton.latitude).to eq(39.986767)
      expect(brighton.longitude).to eq(-104.812604)
    end
  end
end
