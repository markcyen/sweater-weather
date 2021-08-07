require 'rails_helper'

RSpec.describe 'Weather Data Poros' do
  describe 'initialize' do
    before :each do
      brighton_file = File.read('spec/fixtures/webmock/brighton_weather_data.json')
      @brighton_weather_data = JSON.parse(brighton_file, symbolize_names: true)
      @brighton = WeatherData.new(@brighton_weather_data)
    end

    it 'abstracts and encapsulates current weather data that can be read' do
      actual = {
        datetime: '2021-08-06 22:45:37 -0600',
        sunrise: '2021-08-06 06:02:39 -0600',
        sunset: '2021-08-06 20:07:34 -0600',
        temperature: 70.86,
        feels_like: 69.85,
        humidity: 47,
        uvi: 0,
        visibility: 10000,
        conditions: 'broken clouds',
        icon: '04n'
      }
      expect(@brighton.current_weather).to eq(actual)
    end

    it 'abstracts and encapsulates daily weather data that can be read' do
      actual_first = {
        date: '2021-08-06',
        sunrise: '2021-08-06 06:02:39 -0600',
        sunset: '2021-08-06 20:07:34 -0600',
        max_temp: 94.6,
        min_temp: 67.87,
        conditions: 'overcast clouds',
        icon: '04d'
      }
      actual_last = {
        date: '2021-08-10',
        sunrise: '2021-08-10 06:06:29 -0600',
        sunset: '2021-08-10 20:02:45 -0600',
        max_temp: 95.22,
        min_temp: 63.75,
        conditions: 'light rain',
        icon: '10d'
      }

      expect(@brighton.daily_weather).to be_an Array
      expect(@brighton.daily_weather.first).to eq(actual_first)
      expect(@brighton.daily_weather.last).to eq(actual_last)
    end

    it 'abstracts and encapsulates hourly weather data that can be read' do
      actual_first = {
        time: '22:00:00',
        temperature: 70.47,
        conditions: 'broken clouds',
        icon: '04n'
      }
      actual_last = {
        time: '5:00:00',
        temperature: 63.79,
        conditions: 'few clouds',
        icon: '02n'
      }

      expect(@brighton.hourly_weather).to be_an Array
      expect(@brighton.hourly_weather.first).to eq(actual_first)
      expect(@brighton.hourly_weather.last).to eq(actual_last)
    end
  end
end
