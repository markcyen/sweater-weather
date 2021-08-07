class Geocode
  attr_reader :latitude, :longitude

  def initialize(geocode_data)
    @latitude = geocode_data[:results].first[:locations].first[:latLng][:lat]
    @longitude = geocode_data[:results].first[:locations].first[:latLng][:lng]
  end
end
