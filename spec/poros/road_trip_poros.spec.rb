require 'rails_helper'

RSpec.describe 'Road Trip Poros' do
  describe 'initialize' do
    it 'abstracts and encapsulates directions data that can be read' do
      directions_file = File.read('spec/fixtures/webmock/directions_data.json')
      directions_data = JSON.parse(directions_file, symbolize_names: true)
      denver_to_la = RoadTripData.new(directions_data)

      expect(denver_to_la.distance).to eq(1017.692)
      expect(denver_to_la.travel_time).to eq('14:25:59')
    end
  end
end
