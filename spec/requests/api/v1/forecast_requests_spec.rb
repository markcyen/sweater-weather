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
        expect(current_weather[:datetime]).to eq('2021-08-18T15:38:47.000-06:00')
        expect(current_weather[:sunrise]).to eq('2021-08-18T06:14:12.000-06:00')
        expect(current_weather[:sunset]).to eq('2021-08-18T19:52:10.000-06:00')
        expect(current_weather[:temperature]).to eq(93.81)
        expect(current_weather[:feels_like]).to eq(90.01)
        expect(current_weather[:humidity]).to eq(19)
        expect(current_weather[:uvi]).to eq(4.25)
        expect(current_weather[:visibility]).to eq(10000)
        expect(current_weather[:conditions]).to eq('scattered clouds')
        expect(current_weather[:icon]).to eq('03d')
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
        expect(daily_weather.first[:date]).to eq('2021-08-18')
        expect(daily_weather.first[:sunrise]).to eq('2021-08-18T06:14:12.000-06:00')
        expect(daily_weather.first[:sunset]).to eq('2021-08-18T19:52:10.000-06:00')
        expect(daily_weather.first[:max_temp]).to eq(94.75)
        expect(daily_weather.first[:min_temp]).to eq(63.79)
        expect(daily_weather.first[:conditions]).to eq('scattered clouds')
        expect(daily_weather.first[:icon]).to eq('03d')

        expect(daily_weather.last[:date]).to eq('2021-08-22')
        expect(daily_weather.last[:sunrise]).to eq('2021-08-22T06:18:02.000-06:00')
        expect(daily_weather.last[:sunset]).to eq('2021-08-22T19:46:27.000-06:00')
        expect(daily_weather.last[:max_temp]).to eq(95.38)
        expect(daily_weather.last[:min_temp]).to eq(62.47)
        expect(daily_weather.last[:conditions]).to eq('broken clouds')
        expect(daily_weather.last[:icon]).to eq('04d')
      end

      it 'send json of hourly weather data via get request' do
        get '/api/v1/forecast', params: { location: 'brighton, co' }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)
        hourly_weather = json_output[:data][:attributes][:hourly_weather]

        expect(hourly_weather).to be_an Array
        expect(hourly_weather.size).to eq(48)
        hourly_weather.each do |hourly|
          expect(hourly).to be_a Hash
        end
        expect(hourly_weather.first[:time]).to eq('15:00:00')
        expect(hourly_weather.first[:temperature]).to eq(94.42)
        expect(hourly_weather.first[:conditions]).to eq('scattered clouds')
        expect(hourly_weather.first[:icon]).to eq('03d')

        expect(hourly_weather[7][:time]).to eq('22:00:00')
        expect(hourly_weather[7][:temperature]).to eq(75.9)
        expect(hourly_weather[7][:conditions]).to eq('overcast clouds')
        expect(hourly_weather[7][:icon]).to eq('04n')
      end

      it 'returns json error if params is nil' do
        get '/api/v1/forecast'

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Not a valid query')
      end

      it 'returns json error if empty params' do
        get '/api/v1/forecast', params: { location: '' }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Not a valid query')
      end

      it 'returns json error if params is something other than string' do
        get '/api/v1/forecast', params: { location: 80127 }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Not a valid query')
      end
    end
  end
end
