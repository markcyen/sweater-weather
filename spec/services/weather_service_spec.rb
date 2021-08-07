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

          # expect(weather_current[:weather].first).to have_key :description
          # expect(weather_current[:weather].first).to have_key :icon
          # expect(Time.at(weather_current[:dt])).to eq('2021-08-06 22:55:13 -0600')
          # expect(Time.at(weather_current[:sunrise])).to eq('2021-08-06 06:02:39 -0600')
          # expect(Time.at(weather_current[:sunset])).to eq('2021-08-06 20:07:34 -0600')
          # expect(weather_current[:temp]).to eq(70.47)
          # expect(weather_current[:feels_like]).to eq(69.42)
          # expect(weather_current[:humidity]).to eq(47)
          # expect(weather_current[:uvi]).to eq(0)
          # expect(weather_current[:visibility]).to eq(10000)
          # expect(weather_current[:weather].first[:description]).to eq('scattered clouds')
          # expect(weather_current[:weather].first[:icon]).to eq('03n')
        end

        it 'can retrieve daily weather' do
          weather = WeatherService.retrieve_weather(39.986767, -104.812604)

          expect(weather).to be_a Hash
          expect(weather).to have_key :daily
          expect(weather[:daily].first).to have_key :dt
          expect(weather[:daily].first).to have_key :sunrise
          expect(weather[:daily].first).to have_key :sunset
          expect(weather[:daily].first).to have_key :temp
          expect(weather[:daily].first[:temp]).to have_key :max
          expect(weather[:daily].first[:temp]).to have_key :min
          expect(weather[:daily].first).to have_key :weather
          expect(weather[:daily].first[:weather].first).to have_key :description
          expect(weather[:daily].first[:weather].first).to have_key :icon

          # weather_daily_five = weather[:daily].map do |day|
          #   [
          #     day[:dt],
          #     day[:sunrise],
          #     day[:sunset],
          #     day[:temp][:max],
          #     day[:temp][:min],
          #     day[:weather].first[:description],
          #     day[:weather].first[:icon]
          #   ]
          # end[0..4]
          #
          # first_day = weather_daily_five.first
          # second_day = weather_daily_five.second
          # third_day = weather_daily_five.third
          # fourth_day = weather_daily_five.fourth
          # fifth_day = weather_daily_five.fifth
          #
          # expect(Time.at(first_day[0])).to eq('2021-08-06 13:00:00 -0600')
          # expect(Time.at(second_day[1])).to eq('2021-08-07 06:03:36 -0600')
          # expect(Time.at(third_day[2])).to eq('2021-08-08 20:05:12 -0600')
          # expect(fourth_day[3]).to eq(95.5)
          # expect(fifth_day[4]).to eq(63.75)
          # expect(first_day[5]).to eq('overcast clouds')
          # expect(second_day[6]).to eq('10d')
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
