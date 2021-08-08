class ForecastSerializer
  include JSONAPI::Serializer

  def self.send_weather(data)
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: data.current_weather,
          daily_weather: data.daily_weather,
          hourly_weather: data.hourly_weather
        }
      }
    }
  end
end
