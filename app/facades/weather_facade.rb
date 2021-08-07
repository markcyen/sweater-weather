class WeatherFacade
  def self.get_weather_data(city_state)
    coordinates = GeocodeFacade.get_coordinates(city_state)
    weather_data = WeatherService.retrieve_weather(coordinates.latitude, coordinates.longitude)
    WeatherData.new(weather_data)
  end
end
