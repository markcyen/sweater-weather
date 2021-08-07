class GeocodeFacade
  def self.get_geocode(city_state)
    coordinates = GeocodeService.retrieve_geocode(city_state)
    Geocode.new(coordinates)
  end
end
