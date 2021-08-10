class GeocodeService
  class << self
    def retrieve_directions(origin, destination)
      response = conn.get('/directions/v2/route') do |req|
        req.params['key'] = ENV['geocode_key']
        req.params['from'] = origin
        req.params['to'] = destination
      end
      parse_json(response)
    end

    def retrieve_geocode(city_state)
      response = conn.get('/geocoding/v1/address') do |req|
        req.params['key'] = ENV['geocode_key']
        req.params['location'] = city_state
      end
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'http://www.mapquestapi.com')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
