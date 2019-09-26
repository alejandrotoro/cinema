module Cinema
  module V1
    class Bookings < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :bookings do
        desc 'Return list of bookings between dates'
        params do
          requires :start_date, type: Date, desc: 'Start Date to search bookings'
          requires :end_date, type: Date, desc: 'End Date to search bookings'
          optional :movie_id, type: String, desc: 'Filter the bookings by movie'
        end
        get do
          @start_date = params[:start_date]
          @end_date = params[:end_date]
          @movie_id = params[:movie_id]
          bookings = Schedule.get_bookings_by_dates(@start_date, @end_date, @movie_id)
          present bookings, with: Cinema::Entities::Booking, start_date: @start_date, end_date: @end_date, movie_id: @movie_id
        end

        desc 'Create a booking'
        params do
          requires :booking, type: Hash do
            requires :user_id, type: Integer, desc: 'User'
            requires :schedule_id, type: Integer, desc: 'Schedule'
          end
        end
        post do
          booking = Booking.new(params[:booking])
          if booking.save
            present booking, with: Cinema::Entities::Booking
          else
            error!({ error: booking.errors.full_messages }, 401)
          end
        end

      end
    end
  end
end