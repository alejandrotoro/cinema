require 'rails_helper'

describe Cinema::V1::Movies do
  include Rack::Test::Methods

  let(:movie_object) { create(:movie) }
  let(:date) { Date.today + 2.days }

  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  # Tests for the endpoint /api/v1/movies
  describe 'get /' do

    it 'returns HTTP status 200' do
      get '/api/v1/movies'
      expect(last_response.status).to eq 200
    end

    describe 'list of movies without date' do

      before do
        movie_object
        get '/api/v1/movies', params: { date: date }
      end

      it 'it returns with the correct list of movies' do
        expect(JSON.parse(last_response.body)).to eq(
          [
            {
              "description"=>"It II Description",
              "image"=>"It II Image",
              "name"=>"It II Name"
            }
          ]
        )
      end
    end

    describe 'list of movies with date' do

      before do
        movie_object
        get '/api/v1/movies', params: { date: date }
      end

      it 'it returns with the correct list of movies' do
        expect(JSON.parse(last_response.body)).to eq(
          [
            {
              "description"=>"It II Description",
              "image"=>"It II Image",
              "name"=>"It II Name"
            }
          ]
        )
      end
    end
  end
end