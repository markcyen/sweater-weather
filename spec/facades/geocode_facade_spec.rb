require 'rails_helper'

RSpec.describe GeocodeFacade, :vcr do
  describe 'class methods' do
    VCR.use_cassette('geocode coordinates', :record => :new_episodes) do
      describe '.get_geocode' do
        it 'can get geocode coordinates' do
          brighton_geocode = GeocodeFacade.get_coordinates('brighton co')

          expect(brighton_geocode.latitude).to eq(39.986767)
          expect(brighton_geocode.longitude).to eq(-104.812604)
        end
      end
    end
  end
end
