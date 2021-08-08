require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  describe 'class method' do
    VCR.use_cassette('geocode service', :record => :new_episodes) do
      describe '::retrieve_background' do
        it 'can retrieve background photo' do
          response = UnsplashService.retrieve_background('denver, co')

          expect(response).to be_a Hash
          expect(response).to have_key :results
        end
      end
    end
  end
end
