require 'rails_helper'

RSpec.describe 'Weather Details API', :vcr do
  VCR.use_cassette('weather details', :record => :new_episodes) do
    describe 'show response endpoint' do
      it 'send json of weather data via get request' do
        get '/api/v1/forecast', params: { location: 'brighton, co' }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output).to be_a Hash
        expect(json_output).to have_key :data
        expect(json_output[:data]).to be_a Hash
        expect(json_output[:data]).to have_key :id
        expect(json_output[:data][:id]).to eq(nil)
        expect(json_output[:data]).to have_key :type
        expect(json_output[:data][:type]).to eq('forecast')
        expect(json_output[:data]).to have_key :attributes
        expect(json_output[:data][:attributes]).to be_a Hash
        expect(json_output[:data][:attributes]).to have_key :current_weather
        expect(json_output[:data][:attributes]).to have_key :daily_weather
        expect(json_output[:data][:attributes]).to have_key :hourly_weather
      end

      it 'send json of current weather data via get request' do
        get '/api/v1/forecast', params: { location: 'brighton, co' }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)
        current_weather = json_output[:data][:attributes][:current_weather]

        expect(current_weather).to be_a Hash
        expect(current_weather[:datetime]).to eq('2021-08-07T18:04:03.000-06:00')
        expect(current_weather[:sunrise]).to eq('2021-08-07T06:03:36.000-06:00')
        expect(current_weather[:sunset]).to eq('2021-08-07T20:06:23.000-06:00')
        expect(current_weather[:temperature]).to eq(80.74)
        expect(current_weather[:feels_like]).to eq(79.45)
        expect(current_weather[:humidity]).to eq(27)
        expect(current_weather[:uvi]).to eq(1.07)
        expect(current_weather[:visibility]).to eq(6437)
        expect(current_weather[:conditions]).to eq('smoke')
        expect(current_weather[:icon]).to eq('50d')
      end

      it 'send json of daily weather data via get request' do
        get '/api/v1/forecast', params: { location: 'brighton, co' }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)
        daily_weather = json_output[:data][:attributes][:daily_weather]

        expect(daily_weather).to be_an Array
        expect(daily_weather.size).to eq(5)
        daily_weather.each do |daily|
          expect(daily).to be_a Hash
        end
        expect(daily_weather.first[:date]).to eq('2021-08-07')
        expect(daily_weather.first[:sunrise]).to eq('2021-08-07T06:03:36.000-06:00')
        expect(daily_weather.first[:sunset]).to eq('2021-08-07T20:06:23.000-06:00')
        expect(daily_weather.first[:max_temp]).to eq(86.54)
        expect(daily_weather.first[:min_temp]).to eq(63.27)
        expect(daily_weather.first[:conditions]).to eq('scattered clouds')
        expect(daily_weather.first[:icon]).to eq('03d')

        expect(daily_weather.last[:date]).to eq('2021-08-11')
        expect(daily_weather.last[:sunrise]).to eq('2021-08-11T06:07:27.000-06:00')
        expect(daily_weather.last[:sunset]).to eq('2021-08-11T20:01:29.000-06:00')
        expect(daily_weather.last[:max_temp]).to eq(98.13)
        expect(daily_weather.last[:min_temp]).to eq(66.2)
        expect(daily_weather.last[:conditions]).to eq('clear sky')
        expect(daily_weather.last[:icon]).to eq('01d')
      end

      it 'send json of daily weather data via get request' do
        get '/api/v1/forecast', params: { location: 'brighton, co' }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)
        hourly_weather = json_output[:data][:attributes][:hourly_weather]

        expect(hourly_weather).to be_an Array
        expect(hourly_weather.size).to eq(8)
        hourly_weather.each do |hourly|
          expect(hourly).to be_a Hash
        end
        expect(hourly_weather.first[:time]).to eq('18:00:00')
        expect(hourly_weather.first[:temperature]).to eq(80.74)
        expect(hourly_weather.first[:conditions]).to eq('clear sky')
        expect(hourly_weather.first[:icon]).to eq('01d')

        expect(hourly_weather.last[:time]).to eq('1:00:00')
        expect(hourly_weather.last[:temperature]).to eq(67.73)
        expect(hourly_weather.last[:conditions]).to eq('clear sky')
        expect(hourly_weather.last[:icon]).to eq('01n')
      end
    end
  end
end
