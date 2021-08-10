class WeatherService
  class << self
    def retrieve_weather(latitude, longtitude)
      response = conn.get('/data/2.5/onecall') do |req|
        req.params['appid'] = ENV['weather_key']
        req.params['lat'] = latitude
        req.params['lon'] = longtitude
        req.params['units'] = 'imperial'
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(url: 'https://api.openweathermap.org')
    end
  end
end
