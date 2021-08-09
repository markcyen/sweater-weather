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
        expect(json_output[:data][:id]).to eq(nil)
        expect(json_output[:data]).to have_key :type
        expect(json_output[:data][:type]).to eq('breweries')
        expect(json_output[:data]).to have_key :attributes

        expect(json_output[:data][:attributes]).to be_a Hash
        expect(json_output[:data][:attributes]).to have_key :destination
        expect(json_output[:data][:attributes][:destination]).to eq('brighton, co')
        expect(json_output[:data][:attributes]).to have_key :forecast
        expect(json_output[:data][:attributes][:forecast]).to be_a Hash
        expect(json_output[:data][:attributes][:forecast]).to have_key :summary
        expect(json_output[:data][:attributes][:forecast][:summary]).to eq('few clouds')
        expect(json_output[:data][:attributes][:forecast]).to have_key :temperature
        expect(json_output[:data][:attributes][:forecast][:temperature]).to eq('88 F')
        expect(json_output[:data][:attributes]).to have_key :breweries
        expect(json_output[:data][:attributes][:breweries]).to be_an Array
        expect(json_output[:data][:attributes][:breweries].size).to eq(5)

        breweries_list = json_output[:data][:attributes][:breweries]

        breweries_list.each do |brewery|
          expect(brewery).to be_a Hash
          expect(brewery).to have_key :id
          expect(brewery).to have_key :name
          expect(brewery).to have_key :brewery_type
        end
        expect(breweries_list.first[:id]).to eq(8862)
        expect(breweries_list.first[:name]).to eq('Big Choice Brewing Co')
        expect(breweries_list.first[:brewery_type]).to eq('micro')

        expect(breweries_list.third[:id]).to eq(8762)
        expect(breweries_list.third[:name]).to eq('Beer By Design Brewery')
        expect(breweries_list.third[:brewery_type]).to eq('contract')

        expect(breweries_list.last[:id]).to eq(13405)
        expect(breweries_list.last[:name]).to eq('Periodic Brewing Northglenn')
        expect(breweries_list.last[:brewery_type]).to eq('micro')
      end

      it 'sends error when params quantity is 0' do
        get '/api/v1/breweries', params: { location: 'brighton, co', quantity: 0 }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Invalid query')
      end

      it 'sends error when params quantity is less than 0' do
        get '/api/v1/breweries', params: { location: 'brighton, co', quantity: -1 }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Invalid query')
      end

      it 'sends error when params location is numeric' do
        get '/api/v1/breweries', params: { location: 84923, quantity: 5 }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Invalid query')
      end

      it 'sends error when params quantity is not present' do
        get '/api/v1/breweries', params: { location: 'denver,co' }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Invalid query')
      end

      it 'sends error when no params are present' do
        get '/api/v1/breweries'

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Invalid query')
      end

      it 'sends json output when params quantity is a float and rounded up' do
        get '/api/v1/breweries', params: { location: 'denver,co', quantity: 5.7 }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:data][:attributes][:breweries].size).to eq(6)
      end
    end
  end
end
