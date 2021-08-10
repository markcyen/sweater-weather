require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  describe 'class method' do
    VCR.use_cassette('weather service', :record => :new_episodes) do
      describe '::retrieve_weather' do
        it 'can retrieve current weather' do
          weather = WeatherService.retrieve_weather(39.986767, -104.812604)
          weather_current = weather[:current]

          expect(weather).to be_a Hash
          expect(weather_current).to be_a Hash

          expect(weather_current).to have_key :dt
          expect(weather_current).to have_key :sunrise
          expect(weather_current).to have_key :sunset
          expect(weather_current).to have_key :temp
          expect(weather_current).to have_key :feels_like
          expect(weather_current).to have_key :humidity
          expect(weather_current).to have_key :uvi
          expect(weather_current).to have_key :visibility
          expect(weather_current).to have_key :weather
          expect(weather_current[:weather]).to be_an Array
          expect(weather_current[:weather].first).to have_key :description
          expect(weather_current[:weather].first).to have_key :icon
        end

        it 'can retrieve daily weather' do
          weather = WeatherService.retrieve_weather(39.986767, -104.812604)

          expect(weather).to be_a Hash
          expect(weather).to have_key :daily
          expect(weather[:daily]).to be_an Array
          expect(weather[:daily].first).to have_key :dt
          expect(weather[:daily].first).to have_key :sunrise
          expect(weather[:daily].first).to have_key :sunset
          expect(weather[:daily].first).to have_key :temp
          expect(weather[:daily].first[:temp]).to have_key :max
          expect(weather[:daily].first[:temp]).to have_key :min
          expect(weather[:daily].first).to have_key :weather
          expect(weather[:daily].first[:weather].first).to have_key :description
          expect(weather[:daily].first[:weather].first).to have_key :icon
        end

        it 'can retrieve hourly weather' do
          weather = WeatherService.retrieve_weather(39.986767, -104.812604)

          expect(weather).to be_a Hash
          expect(weather).to have_key :hourly
          expect(weather[:hourly].first).to have_key :dt
          expect(weather[:hourly].first).to have_key :temp
          expect(weather[:hourly].first).to have_key :weather
          expect(weather[:hourly].first[:weather].first).to have_key :description
          expect(weather[:hourly].first[:weather].first).to have_key :icon
        end
      end
    end
  end
end
