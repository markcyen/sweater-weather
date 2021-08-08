class UnsplashService
  class << self
    def retrieve_background_image(location, per_page = 1)
      response = conn.get('/search/photos') do |req|
        req.params['client_id'] = ENV['unsplash_key']
        req.params['query'] = location
        req.params['per_page'] = per_page
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(url: 'https://api.unsplash.com')
    end
  end
end
