require 'rails_helper'

RSpec.describe 'Unsplash Data Poros' do
  describe 'initialize' do
    before :all do
      unsplash_file = File.read('spec/fixtures/webmock/unsplash_photo_data.json')
      @denver_photo_data = JSON.parse(unsplash_file, symbolize_names: true)
      @denver = UnsplashData.new(@denver_photo_data, 'denver, co')
    end

    it 'abstracts and encapsulates photo data that can be read' do
      actual = {
        image: {
          location: 'denver, co',
          image_url: 'https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNzR8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg0MzcwOTE&ixlib=rb-1.2.1&q=85',
          credit: {
            source: 'https://unsplash.com/',
            logo: 'https://unsplash.com/s/photos/unsplash-logo',
            author: 'Ryan De Hamer',
            author_portfolio: 'http://www.dehamermedia.com',
            unsplash_source_comment: 'Require the image URLs returned by the API to be directly used or embedded in application (also known as hotlinking)'
          }
        }
      }

      expect(@denver.photos_data.first).to eq(actual)
    end
  end
end
