require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'user registration endpoint' do
    before :all do
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
      User.destroy_all
    end

    it 'returns a response of a user data with id, email, and random api key' do
      user_registration = {
        email: 'userName@test.com',
        password: 'password1',
        password_confirmation: 'password1'
      }
      post '/api/v1/users', params: user_registration.to_json

      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data]).to be_a Hash
      expect(response_body[:data]).to have_key :id
      expect(response_body[:data][:id]).to eq('1')
      expect(response_body[:data]).to have_key :type
      expect(response_body[:data][:type]).to eq('users')
      expect(response_body[:data]).to have_key :attributes
      expect(response_body[:data][:attributes]).to be_a Hash
      expect(response_body[:data][:attributes]).to have_key :email
      expect(response_body[:data][:attributes][:email]).to eq('username@test.com')
      expect(response_body[:data][:attributes]).to have_key :api_key
    end

    it 'returns error when given an incorrect password' do
      user_registration = {
        email: 'userName@test.com',
        password: 'password1',
        password_confirmation: 'password'
      }
      post '/api/v1/users', params: user_registration.to_json

      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:type]).to eq('error')
      expect(response_body[:data][:error_message]).to eq("Password confirmation doesn't match Password")
    end

    it 'returns error when user email already exists' do
      create(:user, email: 'username@test.com')
      user_registration = {
        email: 'username@test.com',
        password: 'password1',
        password_confirmation: 'password1'
      }
      post '/api/v1/users', params: user_registration.to_json

      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:type]).to eq('error')
      expect(response_body[:data][:error_message]).to eq('Email has already been taken')
    end

    it 'returns error when email is left blank' do
      user_registration = {
        email: '',
        password: 'password1',
        password_confirmation: 'password1'
      }
      post '/api/v1/users', params: user_registration.to_json

      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:type]).to eq('error')
      expect(response_body[:data][:error_message]).to eq("Email can't be blank and Email is invalid")
    end

    it 'returns error when email is invalid' do
      user_registration = {
        email: 'sdfjlsdjkfsdlk',
        password: 'password1',
        password_confirmation: 'password1'
      }
      post '/api/v1/users', params: user_registration.to_json

      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:type]).to eq('error')
      expect(response_body[:data][:error_message]).to eq('Email is invalid')
    end
  end
end
