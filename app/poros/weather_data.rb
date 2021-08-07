class WeatherData
  attr_reader :current_weather

  def initialize(weather_data)
    @current_weather = current(weather_data)
  end

  def current(weather_data)
    current_data = weather_data[:current]
    {
      datetime: Time.at(current_data[:dt]),
      sunrise: Time.at(current_data[:sunrise]),
      sunset: Time.at(current_data[:sunset]),
      temperature: current_data[:temp],
      feels_like: current_data[:feels_like],
      humidity: current_data[:humidity],
      uvi: current_data[:uvi],
      visibility: current_data[:visibility],
      conditions: current_data[:weather].first[:description],
      icon: current_data[:weather].first[:icon]
    }
  end
end
