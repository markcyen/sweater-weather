require 'rails_helper'

RSpec.describe BreweriesService, :vcr do
  describe 'class method' do
    VCR.use_cassette('breweries service', :record => :new_episodes) do
      describe '::retrieve_breweries' do
        it 'can retrieve breweries' do
          breweries_api = BreweriesService.retrieve_breweries('denver,co', 5)

          expect(breweries_api).to be_a Array
          expect(breweries_api.size).to eq(5)
          expect(breweries_api.first).to be_a Hash
          expect(breweries_api.first).to have_key :id
          expect(breweries_api.first).to have_key :name
          expect(breweries_api.first).to have_key :brewery_type
        end
      end
    end
  end
end
