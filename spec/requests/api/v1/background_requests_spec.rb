require 'rails_helper'

RSpec.describe 'Background Image Details API', :vcr do
  VCR.use_cassette('background image details', :record => :new_episodes) do
    describe 'show response endpoint' do
      it 'send json response of background image' do
        get '/api/v1/background', params: { query: 'denver, co', per_page: 2 }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output).to be_a Hash
        expect(json_output).to have_key :data
        expect(json_output[:data]).to be_a Hash
        expect(json_output[:data]).to have_key :id
        expect(json_output[:data][:id]).to eq(nil)
        expect(json_output[:data]).to have_key :type
        expect(json_output[:data][:type]).to eq('image')
        expect(json_output[:data]).to have_key :attributes
        expect(json_output[:data][:attributes]).to be_a Hash
        expect(json_output[:data][:attributes]).to have_key :image
        expect(json_output[:data][:attributes][:image]).to be_an Array
        expect(json_output[:data][:attributes][:image].first).to be_a Hash
        expect(json_output[:data][:attributes][:image].first).to have_key :image
        expect(json_output[:data][:attributes][:image].first[:image]).to be_a Hash
        expect(json_output[:data][:attributes][:image].first[:image]).to have_key :location
        expect(json_output[:data][:attributes][:image].first[:image][:location]).to eq('denver, co')
        expect(json_output[:data][:attributes][:image].first[:image]).to have_key :image_url
        expect(json_output[:data][:attributes][:image].first[:image][:image_url]).to eq('https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNzR8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2Mjg0MzcxODE&ixlib=rb-1.2.1&q=85')
        expect(json_output[:data][:attributes][:image].first[:image]).to have_key :credit
        expect(json_output[:data][:attributes][:image].first[:image][:credit]).to be_a Hash
        expect(json_output[:data][:attributes][:image].first[:image][:credit]).to have_key :source
        expect(json_output[:data][:attributes][:image].first[:image][:credit][:source]).to eq('https://unsplash.com/')
        expect(json_output[:data][:attributes][:image].first[:image][:credit]).to have_key :logo
        expect(json_output[:data][:attributes][:image].first[:image][:credit][:logo]).to eq('https://unsplash.com/s/photos/unsplash-logo')
        expect(json_output[:data][:attributes][:image].first[:image][:credit]).to have_key :author
        expect(json_output[:data][:attributes][:image].first[:image][:credit][:author]).to eq('Ryan De Hamer')
        expect(json_output[:data][:attributes][:image].first[:image][:credit]).to have_key :author_portfolio
        expect(json_output[:data][:attributes][:image].first[:image][:credit][:author_portfolio]).to eq('http://www.dehamermedia.com')
        expect(json_output[:data][:attributes][:image].first[:image][:credit]).to have_key :unsplash_source_comment
        expect(json_output[:data][:attributes][:image].first[:image][:credit][:unsplash_source_comment]).to eq('Require the image URLs returned by the API to be directly used or embedded in application (also known as hotlinking)')
      end
    end
  end
end
