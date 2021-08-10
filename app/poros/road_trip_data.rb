class RoadTripData
  attr_reader :distance, :travel_time

  def initialize(directions_data)
    @distance = directions_data[:route][:distance]
    @travel_time = directions_data[:route][:formattedTime]
  end
end
