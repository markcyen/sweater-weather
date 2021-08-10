class RoadTripData
  attr_reader :distance, :formatted_time, :time_in_seconds

  def initialize(directions_data)
    @distance = directions_data[:route][:distance]
    @formatted_time = directions_data[:route][:formattedTime]
    @time_in_seconds = directions_data[:route][:realTime]
  end
end
