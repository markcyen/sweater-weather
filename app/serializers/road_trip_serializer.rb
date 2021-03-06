class RoadTripSerializer
  include JSONAPI::Serializer

  def self.send_trip_details(origin, destination, trip_data, weather_at_eta)
    {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time:
            if trip_data.travel_time.nil? || trip_data.distance > 3400
              'impossible'
            else
              "#{trip_data.travel_time.split(':')[0]} hours, #{trip_data.travel_time.split(':')[1]} minutes"
            end,
          weather_at_eta: {
            temperature:
              if trip_data.travel_time.nil? || trip_data.distance > 3400
                ''
              elsif trip_data.travel_time.split(':')[0].to_i > 47
                weather_at_eta.hourly_weather[47][:temperature]
              else
                weather_at_eta.hourly_weather[trip_data.travel_time.split(':')[0].to_i][:temperature]
              end,
            conditions:
              if trip_data.travel_time.nil? || trip_data.distance > 3400
                ''
              elsif trip_data.travel_time.split(':')[0].to_i > 47
                weather_at_eta.hourly_weather[47][:conditions]
              else
                weather_at_eta.hourly_weather[trip_data.travel_time.split(':')[0].to_i][:conditions]
              end
          }
        }
      }
    }
  end
end
