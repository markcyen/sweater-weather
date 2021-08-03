require 'rails_helper'

RSpec.describe GeocodeService, :vcr do
  describe 'class method' do
    VCR.use_cassette('geocode service', :record => :new_episodes) do
      describe '::retrieve_geocode' do
        it 'can retrieve geocode' do
          response = GeocodeService.retrieve_geocode('brighton colorado')

          expect(response).to be_a Hash
          expect(response[:results]).to be_an Array

          geocode = response[:results].first[:locations].first[:latLng]

          expect(geocode[:lat]).to eq(39.986767)
          expect(geocode[:lng]).to eq(-104.812604)
        end
      end
    end
  end
end
