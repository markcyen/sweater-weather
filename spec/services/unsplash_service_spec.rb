require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  describe 'class method' do
    VCR.use_cassette('geocode service', :record => :new_episodes) do
      describe '::retrieve_background_image' do
        it 'can retrieve background photo' do
          response = UnsplashService.retrieve_background_image('denver, co', 2)

          expect(response).to be_a Hash
          expect(response).to have_key :results
          expect(response[:results]).to be_an Array
          expect(response[:results].first).to be_a Hash
          expect(response[:results].first).to have_key :description
          expect(response[:results].first).to have_key :urls
          expect(response[:results].first[:urls]).to be_a Hash
          expect(response[:results].first[:urls]).to have_key :full
          expect(response[:results].first[:user]).to have_key :portfolio_url

          # description
          # image_url: urls: {full: xxxx},
          # credit: {source: 'unsplash.com',  author: xxxx (user: {name: }), logo (): xxxx}
        end
      end
    end
  end
end
