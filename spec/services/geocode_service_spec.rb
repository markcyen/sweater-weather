require 'rails_helper'

RSpec.describe GeocodeService, :vcr do
  describe 'class method' do
    VCR.use_cassette('geocode service', :record => :new_episodes) do
      describe '::retrieve_geocode' do
        it 'can retrieve geocode' do
          response = GeocodeService.retrieve_geocode('brighton colorado')

          expect(response).to be_a Hash
          expect(response).to have_key :results
          expect(response[:results]).to be_an Array
          expect(response[:results].first).to be_a Hash
          expect(response[:results].first).to have_key :locations
          expect(response[:results].first[:locations]).to be_an Array
          expect(response[:results].first[:locations].first).to be_a Hash
          expect(response[:results].first[:locations].first).to have_key :latLng
          expect(response[:results].first[:locations].first[:latLng]).to be_a Hash
          expect(response[:results].first[:locations].first[:latLng]).to have_key :lat
          expect(response[:results].first[:locations].first[:latLng]).to have_key :lng

          geocode = response[:results].first[:locations].first[:latLng]

          expect(geocode[:lat]).to eq(39.986767)
          expect(geocode[:lng]).to eq(-104.812604)
        end
      end

      describe '::retrieve_directions' do
        it 'can consume directions from mapquest API' do
          response = GeocodeService.retrieve_directions('denver, co', 'los angeles, ca')

          expect(response).to be_a Hash
          expect(response).to have_key :route
          expect(response[:route]).to be_a Hash
          expect(response[:route]).to have_key :distance
          expect(response[:route][:distance]).to be_a Float
          expect(response[:route]).to have_key :formattedTime
          expect(response[:route][:formattedTime]).to be_a String
        end
      end
    end
  end
end
