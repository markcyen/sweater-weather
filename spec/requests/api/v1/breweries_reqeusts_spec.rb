require 'rails_helper'

RSpec.describe 'Breweries Details API', :vcr do
  VCR.use_cassette('breweries details', :record => :new_episodes) do
    describe 'show response endpoint' do
      it 'send json of breweries data via get request' do
        get '/api/v1/breweries', params: { location: 'brighton, co', quantity: 5 }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output).to be_a Hash
        expect(json_output).to have_key :data
        expect(json_output[:data]).to be_a Hash
        expect(json_output[:data]).to have_key :id
        expect(json_output[:data]).to have_key :type
        expect(json_output[:data]).to have_key :attributes

        expect(json_output[:data][:attributes]).to be_a Hash
        expect(json_output[:data][:attributes]).to have_key :destination
        expect(json_output[:data][:attributes]).to have_key :forecast
        expect(json_output[:data][:attributes]).to have_key :breweries
      end
    end
  end
end
