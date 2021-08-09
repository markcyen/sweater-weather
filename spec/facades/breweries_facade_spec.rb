require 'rails_helper'

RSpec.describe BreweriesFacade, :vcr do
  describe 'class methods' do
    VCR.use_cassette('breweries details', :record => :new_episodes) do
      describe '.get_breweries_data' do
        it 'can get breweries data' do
          brighton = BreweriesFacade.get_breweries_data('brighton, co', 5)

          expect(brighton).to be_a BreweriesData
          expect(brighton.breweries_list.size).to eq(5)
          brighton.breweries_list.each do |brewery|
            expect(brewery).to have_key :id
            expect(brewery[:id]).to be_an Integer
            expect(brewery).to have_key :name
            expect(brewery[:name]).to be_a String
            expect(brewery).to have_key :brewery_type
            expect(brewery[:brewery_type]).to be_a String
          end
          expect(brighton.breweries_list.first[:id]).to eq(8862)
          expect(brighton.breweries_list.first[:name]).to eq('Big Choice Brewing Co')
          expect(brighton.breweries_list.first[:brewery_type]).to eq('micro')
          expect(brighton.breweries_list.last[:id]).to eq(13405)
          expect(brighton.breweries_list.last[:name]).to eq('Periodic Brewing Northglenn')
          expect(brighton.breweries_list.last[:brewery_type]).to eq('micro')
        end
      end
    end
  end
end
