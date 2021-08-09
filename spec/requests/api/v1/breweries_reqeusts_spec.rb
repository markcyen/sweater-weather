require 'rails_helper'

RSpec.describe 'Breweries Details API', :vcr do
  VCR.use_cassette('breweries details', :record => :new_episodes) do
    describe 'show response endpoint' do
      it 'send json of breweries data via get request' do
        get '/api/v1/breweries', params: { location: 'brighton, co', quantity: 5 }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output).to be_a Hash
      end
    end
  end
end
