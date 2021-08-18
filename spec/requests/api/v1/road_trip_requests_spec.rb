require 'rails_helper'

RSpec.describe 'Road Trip', :vcr do
  describe 'user road trip endpoint' do
    before :all do
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
      User.destroy_all
    end

    VCR.use_cassette('directions details', :record => :new_episodes) do
      it 'returns a response of a user road trip details' do
        user = create(:user, password: 'password1', api_key: 'sklde02kmr0fxdssodks')
        post '/api/v1/road_trip', params: {
          start_city: 'border field state park, ca',
          end_city: 'bangor, me',
          api_key: 'sklde02kmr0fxdssodks'
        }, as: :json

        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:data][:id]).to eq(nil)
        expect(response_body[:data][:type]).to eq('roadtrip')
        expect(response_body[:data][:attributes][:start_city]).to eq('border field state park, ca')
        expect(response_body[:data][:attributes][:end_city]).to eq('bangor, me')
        expect(response_body[:data][:attributes][:travel_time]).to eq('49 hours, 12 minutes')
        expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to eq(90.93)
        expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to eq('scattered clouds')

        bangor_me_weather = WeatherFacade.get_weather_data('bangor, me')

        expect(bangor_me_weather.hourly_weather.first[:time]).to eq('15:00:00')
        expect(bangor_me_weather.hourly_weather.first[:temperature]).to eq(73.35)
        expect(bangor_me_weather.hourly_weather[47][:time]).to eq('14:00:00')
        expect(bangor_me_weather.hourly_weather[47][:temperature]).to eq(84.97)
      end

      it 'returns a response with temperature and conditions with hourly array limit' do
        user = create(:user, password: 'password1', api_key: 'sklde02kmr0fxdssodks')
        post '/api/v1/road_trip', params: {
          start_city: 'denver,co',
          end_city: 'los angeles, ca',
          api_key: 'sklde02kmr0fxdssodks'
        }, as: :json

        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:data][:attributes][:travel_time]).to eq('14 hours, 25 minutes')
        expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to eq(77.7)
        expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to eq('few clouds')

        los_angeles_weather = WeatherFacade.get_weather_data('los angeles, ca')

        expect(los_angeles_weather.hourly_weather[14][:temperature]).to eq(70.3)
        expect(los_angeles_weather.hourly_weather[14][:conditions]).to eq('overcast clouds')
      end

      it 'returns an adequate response when destination is impossible' do
        user = create(:user, password: 'password1', api_key: 'sklde02kmr0fxdssodks')
        post '/api/v1/road_trip', params: {
          start_city: 'denver,co',
          end_city: 'london, uk',
          api_key: 'sklde02kmr0fxdssodks'
        }, as: :json

        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:data][:attributes][:travel_time]).to eq('impossible')
        expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to eq('')
        expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to eq('')
      end

      it 'returns an error when there is an incorrect api key' do
        user = create(:user, password: 'password1', api_key: 'sklde02kmr0fxdssodks')
        post '/api/v1/road_trip', params: {
          start_city: 'denver,co',
          end_city: 'los angeles,ca',
          api_key: 'sklde02kmr'
        }, as: :json

        expect(response.status).to eq(401)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:data][:error_message]).to eq('Invalid entry')
      end

      it 'returns an error when there is no destination' do
        user = create(:user, password: 'password1', api_key: 'sklde02kmr0fxdssodks')
        post '/api/v1/road_trip', params: {
          start_city: 'denver,co',
          api_key: 'sklde02kmr0fxdssodks'
        }, as: :json

        expect(response.status).to eq(400)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:data][:error_message]).to eq('Bad request')
      end
    end
  end
end
