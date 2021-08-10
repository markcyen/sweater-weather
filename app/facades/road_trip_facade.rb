class RoadTripFacade
  def self.get_directions_data(origin, destination)
    directions = GeocodeService.retrieve_directions(origin, destination)
    RoadTripData.new(directions)
  end
end
