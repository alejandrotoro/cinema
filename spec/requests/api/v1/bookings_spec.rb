require 'rails_helper'

describe Cinema::V1::Bookings do
  include Rack::Test::Methods

  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:schedule) { create(:schedule, movie: movie) }
  let(:booking_object) { create(:booking, schedule: schedule, user: user) }
  let(:start_date) { Date.today + 2.days }
  let(:end_date) { Date.today + 2.days }
  let(:valid_params) do
    {
      "booking": {
         "user_id": user.id,
         "schedule_id": schedule.id
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

  # Tests for the endpoint /api/v1/bookings
  describe 'GET /api/v1/bookings' do
    it 'returns HTTP status 200' do
      get '/api/v1/bookings', { start_date: start_date, end_date: end_date }
      expect(last_response.status).to eq 200
    end

    describe 'list of bookings between dates' do
      before do
        booking_object
        get '/api/v1/bookings', { start_date: start_date, end_date: end_date }
      end
      it 'it returns with the correct list of bookings' do
        expect(JSON.parse(last_response.body)).to eq(
          [
            {
              "end_date"=>"2019-09-28",
              "schedule"=> {
                "date"=>"2019/0928 12:00 AM",
                "movie"=> {
                  "description"=>"It II Description",
                  "image"=>"It II Image",
                  "name"=>"It II Name"
                }
              },
              "start_date"=>"2019-09-28",
              "user"=> {
                "email"=>"john.doe@cinema.com",
                "first_name"=>"John",
                "last_name"=>"Doe"
              }
            }
          ]
        )
      end
    end

    describe 'list of bookings between dates and with movie_id' do
      before do
        booking_object
        get '/api/v1/bookings', { start_date: start_date, end_date: end_date, movie_id: movie.id }
      end
      it 'it returns with the correct list of bookings' do
        expect(JSON.parse(last_response.body)).to eq(
          [
            {
              "end_date"=>"2019-09-28",
              "schedule"=> {
                "date"=>"2019/0928 12:00 AM",
                "movie"=> {
                  "description"=>"It II Description",
                  "image"=>"It II Image",
                  "name"=>"It II Name"
                }
              },
              "start_date"=>"2019-09-28",
              "user"=> {
                "email"=>"john.doe@cinema.com",
                "first_name"=>"John",
                "last_name"=>"Doe"
              }
            }
          ]
        )
      end
    end

    describe 'list of errors if not correct params' do
      before do
        booking_object
        get '/api/v1/bookings', { }
      end
      it 'it returns with the correct list of bookings' do
        expect(JSON.parse(last_response.body)).to eq(
          "error" => "start_date is missing, end_date is missing"
        )
      end
    end
  end

  # Tests for the endpoint GET /api/v1/bookings
  describe 'POST /api/v1/bookings' do
    context 'with valid attributes' do
      it 'returns HTTP status 201 - Created' do
        post '/api/v1/bookings', valid_params.to_json
        expect(last_response.status).to eq 201
      end
      it 'creates a Movie' do
        post '/api/v1/bookings', valid_params.to_json
        expect(JSON.parse(last_response.body)).to eq(
          "schedule" => {
            "date"=>"2019/0928 12:00 AM",
            "movie"=>{
              "description"=>"It II Description",
              "image"=>"It II Image",
              "name"=>"It II Name"
            }
          },
          "user" => {
            "email"=>"john.doe@cinema.com",
            "first_name"=>"John",
            "last_name"=>"Doe"
          }
        )
      end
    end

    context 'with invalid attributes' do
      it 'returns HTTP status 400 - Bad Request' do
        post '/api/v1/bookings', invalid_params.to_json
        expect(last_response.status).to eq 400
        expect(JSON.parse(last_response.body)).to eq(
          "error" => "booking is missing, booking[user_id] is missing, booking[schedule_id] is missing"
        )
      end

    end
  end
end