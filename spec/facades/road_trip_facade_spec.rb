require 'rails_helper'

RSpec.describe 'Road Trip Facade', :vcr do
  describe 'class methods' do
    VCR.use_cassette('directions details', :record => :new_episodes) do
      describe '.get_directions_data' do
        it 'can get directions data' do
          directions = RoadTripFacade.get_directions_data('denver,co', 'los angeles,ca')

          expect(directions).to be_a RoadTripData
          expect(directions.distance).to eq(1017.692)
          expect(directions.formatted_time).to eq('14:25:59')
        end
      end
    end
  end
end
