require 'rails_helper'

describe Cinema::V1::Movies do
  include Rack::Test::Methods

  let(:movie_object) { create(:movie) }
  let(:date) { Date.today + 2.days }
  let(:valid_params) do
    {
      movie: {
        name: "It II",
        description: "This is it the Clown Movie"
      },
      schedule: {
        date: "2019/09/30 22:00"
      }
    }
  end
  let(:invalid_params) do
    {}
  end
  
  before do
    header 'Content-Type', 'application/json'
    header 'Accept-Encoding', 'application/json'
  end

  # Tests for the endpoint GET /api/v1/movies
  describe 'GET /api/v1/movies' do
    it 'returns HTTP status 200' do
      get '/api/v1/movies'
      expect(last_response.status).to eq 200
    end

    describe 'list of movies without date' do
      before do
        movie_object
        get '/api/v1/movies'
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

  # Tests for the endpoint GET /api/v1/movies
  describe 'POST /api/v1/movies' do
    context 'with valid attributes' do
      it 'returns HTTP status 201 - Created' do
        post '/api/v1/movies', valid_params.to_json
        expect(last_response.status).to eq 201
      end
      it 'creates a Movie' do
        post '/api/v1/movies', valid_params.to_json
        expect(JSON.parse(last_response.body)).to eq(
          {
            "date" => "2019-09-30T22:00:00.000+00:00",
            "description" => "This is it the Clown Movie",
            "image" => nil,
            "name" => "It II"
          }
        )
      end
    end

    context 'with invalid attributes' do
      it 'returns HTTP status 400 - Bad Request' do
        post '/api/v1/movies', invalid_params.to_json
        expect(last_response.status).to eq 400
        expect(JSON.parse(last_response.body)).to eq(
          "error" => "movie is missing, movie[name] is missing, movie[description] is missing, schedule is missing, schedule[date] is missing"
        )
      end

    end
  end
end