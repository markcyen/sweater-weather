class BrewerySerializer
  include JSONAPI::Serializer

  def self.send_breweries(data, location, current_weather)
    {
      data: {
        id: nil,
        type: 'breweries',
        attributes: {
          destination: location,
          forecast: {
            summary: current_weather[:conditions],
            temperature: current_weather[:temperature].round(0).to_s + ' F'
          },
          breweries: data.breweries_list
        }
      }
    }
  end
end
