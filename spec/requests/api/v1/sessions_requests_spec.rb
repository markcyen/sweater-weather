require 'rails_helper'

RSpec.describe 'User Login Sessions' do
  describe 'user login session endpoint' do
    before :all do
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
      User.destroy_all
    end

    it 'returns a response of a user data with id, email, and random api key from login session' do
      user = create(:user, password: 'password1')
      post '/api/v1/sessions', params: {
        email: user.email,
        password: user.password
      }, as: :json

      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data]).to be_a Hash
      expect(response_body[:data]).to have_key :id
      expect(response_body[:data][:id]).to eq(user.id.to_s)
      expect(response_body[:data]).to have_key :type
      expect(response_body[:data][:type]).to eq('users')
      expect(response_body[:data]).to have_key :attributes
      expect(response_body[:data][:attributes]).to be_a Hash
      expect(response_body[:data][:attributes]).to have_key :email
      expect(response_body[:data][:attributes][:email]).to eq(user.email)
      expect(response_body[:data][:attributes]).to have_key :api_key
    end

    it 'returns error when given an incorrect password' do
      user = create(:user, password: 'password1')
      post '/api/v1/sessions', params: {
        email: user.email,
        password: 'password'
      }, as: :json

      expect(response.status).to eq(401)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:type]).to eq('error')
      expect(response_body[:data][:error_message]).to eq('Invalid email or password')
    end

    it 'returns error when given an incorrect email address' do
      user = create(:user, email: 'username@test.com', password: 'password1')
      post '/api/v1/sessions', params: {
        email: 'username1@test.com',
        password: 'password1'
      }, as: :json

      expect(response.status).to eq(401)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:type]).to eq('error')
      expect(response_body[:data][:error_message]).to eq('Invalid email or password')
    end
  end
end
