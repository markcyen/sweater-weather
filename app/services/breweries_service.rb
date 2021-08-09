class BreweriesService
  class << self
    def retrieve_breweries(city_state, quantity)
      lat_long = GeocodeService.retrieve_geocode(city_state)
      lat = lat_long[:results].first[:locations].first[:latLng][:lat].to_s
      long = lat_long[:results].first[:locations].first[:latLng][:lng].to_s
      distance = lat + ',' + long
      response = conn.get('/breweries') do |req|
        req.params['by_dist'] = distance
        req.params['per_page'] = quantity
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(url: 'https://api.openbrewerydb.org')
    end
  end
end
