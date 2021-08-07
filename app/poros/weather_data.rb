class WeatherData
  attr_reader :current_weather, :daily_weather

  def initialize(weather_data)
    @current_weather = current(weather_data)
    @daily_weather = daily(weather_data)
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

  def daily(weather_data)
    weather_data[:daily].map do |daily|
      {
        date: Time.at(daily[:dt]).strftime('%Y-%m-%d'),
        sunrise: Time.at(daily[:sunrise]),
        sunset: Time.at(daily[:sunset]),
        max_temp: daily[:temp][:max],
        min_temp: daily[:temp][:min],
        conditions: daily[:weather].first[:description],
        icon: daily[:weather].first[:icon]
      }
    end[0..4]
  end
end
