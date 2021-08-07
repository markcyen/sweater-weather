require 'rails_helper'

RSpec.describe 'GeoCode Poros' do
  describe 'initialize' do
    it 'abstracts and encapsulates geocode data that can be read' do
      brighton_file = File.read('spec/fixtures/webmock/brighton_geocode_data.json')
      brighton_geocode_data = JSON.parse(brighton_file, symbolize_names: true)
      brighton = Geocode.new(brighton_geocode_data)

      expect(brighton.latitude).to eq(39.986767)
      expect(brighton.longitude).to eq(-104.812604)
    end
  end
end
