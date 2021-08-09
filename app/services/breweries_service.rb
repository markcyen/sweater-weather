class BreweriesService
  class << self
    def retrieve_breweries(distance, quantity)
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
