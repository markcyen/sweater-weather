require 'rails_helper'

RSpec.describe 'Background Image Details API', :vcr do
  VCR.use_cassette('background image details', :record => :new_episodes) do
    describe 'show response endpoint' do
      it 'send json response of background image' do
        get '/api/v1/background', params: {
          query: 'denver, co',
          per_page: 2
        }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output).to be_a Hash
        expect(json_output[:data][:id]).to eq(nil)
        expect(json_output[:data][:type]).to eq('image')
        expect(json_output[:data][:attributes][:image]).to be_an Array
        expect(json_output[:data][:attributes][:image].size).to eq(2)
        expect(json_output[:data][:attributes][:image].second[:image][:location]).to eq('denver, co')
        expect(json_output[:data][:attributes][:image].second[:image][:image_url]).to eq('https://images.unsplash.com/photo-1610411084826-5c980e287458?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNzR8MHwxfHNlYXJjaHwyfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2Mjg0MzcxODE&ixlib=rb-1.2.1&q=85')
        expect(json_output[:data][:attributes][:image].second[:image][:credit][:source]).to eq('https://unsplash.com/')
        expect(json_output[:data][:attributes][:image].second[:image][:credit][:logo]).to eq('https://unsplash.com/s/photos/unsplash-logo')
        expect(json_output[:data][:attributes][:image].second[:image][:credit][:author]).to eq('Nima Sarram')
        expect(json_output[:data][:attributes][:image].second[:image][:credit][:author_portfolio]).to eq(nil)
        expect(json_output[:data][:attributes][:image].second[:image][:credit][:unsplash_source_comment]).to eq('Require the image URLs returned by the API to be directly used or embedded in application (also known as hotlinking)')
      end

      it 'sends a json response default one image per page' do
        get '/api/v1/background', params: { query: 'denver, co' }

        expect(response.status).to eq(200)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:data][:attributes][:image]).to be_an Array
        expect(json_output[:data][:attributes][:image].size).to eq(1)
      end

      it 'sends an error response if query is not present' do
        get '/api/v1/background'

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Not a valid query')
      end

      it 'sends an error response if query is not a string' do
        get '/api/v1/background', params: { query: 39204 }

        expect(response.status).to eq(404)

        json_output = JSON.parse(response.body, symbolize_names: true)

        expect(json_output[:error]).to eq('Not a valid query')
      end
    end
  end
end
