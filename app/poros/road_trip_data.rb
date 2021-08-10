class RoadTripData
  attr_reader :distance, :formatted_time

  def initialize(directions_data)
    @distance = directions_data[:route][:distance]
    @formatted_time = directions_data[:route][:formattedTime]
  end
end
