require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  describe 'class methods' do
    VCR.use_cassette('weather details', :record => :new_episodes) do
      describe '.get_weather_data' do
        it 'can get current weather data' do
          brighton = WeatherFacade.get_weather_data('brighton co')

          expect(brighton).to be_a WeatherData
          expect(brighton.current_weather).to be_a Hash
          expect(brighton.current_weather).to have_key :datetime
          expect(brighton.current_weather).to have_key :sunrise
          expect(brighton.current_weather).to have_key :sunset
          expect(brighton.current_weather).to have_key :temperature
          expect(brighton.current_weather).to have_key :feels_like
          expect(brighton.current_weather).to have_key :humidity
          expect(brighton.current_weather).to have_key :uvi
          expect(brighton.current_weather).to have_key :visibility
          expect(brighton.current_weather).to have_key :conditions
          expect(brighton.current_weather).to have_key :icon

          expect(brighton.daily_weather).to be_an Array
          expect(brighton.daily_weather.size).to eq(5)

          brighton.daily_weather.each do |daily|
            expect(daily).to have_key :date
            expect(daily).to have_key :sunrise
            expect(daily).to have_key :sunset
            expect(daily).to have_key :max_temp
            expect(daily).to have_key :min_temp
            expect(daily).to have_key :conditions
            expect(daily).to have_key :icon
          end

          expect(brighton.hourly_weather).to be_an Array
          expect(brighton.hourly_weather.size).to eq(48)

          brighton.hourly_weather.each do |hourly|
            expect(hourly).to have_key :time
            expect(hourly).to have_key :temperature
            expect(hourly).to have_key :conditions
            expect(hourly).to have_key :icon
          end
        end
      end
    end
  end
end
