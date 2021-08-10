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
          origin: 'border field state park, ca',
          destination: 'bangor, me',
          api_key: 'sklde02kmr0fxdssodks'
        }, as: :json

        expect(response.status).to eq(200)

        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response_body[:data][:id]).to eq(nil)
        expect(response_body[:data][:type]).to eq('roadtrip')
        expect(response_body[:data][:attributes][:start_city]).to eq('border field state park, ca')
        expect(response_body[:data][:attributes][:end_city]).to eq('bangor, me')
        expect(response_body[:data][:attributes][:travel_time]).to eq('49 hours, 12 minutes')
        expect(response_body[:data][:attributes][:weather_at_eta][:temperature]).to eq(91.83)
        expect(response_body[:data][:attributes][:weather_at_eta][:conditions]).to eq('overcast clouds')
      end
    end
  end
end
