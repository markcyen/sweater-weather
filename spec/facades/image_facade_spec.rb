require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  describe 'class methods' do
    VCR.use_cassette('image details', :record => :new_episodes) do
      describe '.get_image_data' do
        it 'can get background image data' do
          denver = ImageFacade.get_image_data('denver, co', 2)

          expect(denver).to be_a UnsplashData
          expect(denver.photos_data).to be_an Array
          expect(denver.photos_data.first).to have_key :image
          expect(denver.photos_data.first[:image]).to have_key :location
          expect(denver.photos_data.first[:image][:location]).to eq('denver, co')
          expect(denver.photos_data.first[:image][:image_url]).to eq('https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNzR8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2Mjg0MzcxODE&ixlib=rb-1.2.1&q=85')

          expect(denver.photos_data.first[:image][:credit][:source]).to eq('https://unsplash.com/')
          expect(denver.photos_data.first[:image][:credit][:logo]).to eq('https://unsplash.com/s/photos/unsplash-logo')
          expect(denver.photos_data.first[:image][:credit][:author]).to eq('Ryan De Hamer')
          expect(denver.photos_data.first[:image][:credit][:author_portfolio]).to eq('http://www.dehamermedia.com')
          expect(denver.photos_data.first[:image][:credit][:unsplash_source_comment]).to eq('Require the image URLs returned by the API to be directly used or embedded in application (also known as hotlinking)')
        end
      end
    end
  end
end
