require 'rails_helper'

RSpec.describe 'Breweries Data Poros' do
  describe 'initialize' do
    before :all do
      brighton_breweries_file = File.read('spec/fixtures/webmock/brighton_breweries_data.json')
      @brighton_breweries_data = JSON.parse(brighton_breweries_file, symbolize_names: true)
      @brighton_breweries = BreweriesData.new(@brighton_breweries_data)
    end

    it 'abstracts and encapsulates breweries data that can be read' do
      actual_first = {
        id: 13302,
        name: 'Padre Island Brewing Co',
        brewery_type: 'brewpub'
      }

      actual_last = {
        id: 13665,
        name: 'Railroad Seafood Station & Brewing Co.',
        brewery_type: 'brewpub'
      }

      expect(@brighton_breweries.breweries_list.first).to eq(actual_first)
      expect(@brighton_breweries.breweries_list.last).to eq(actual_last)
    end
  end
end
