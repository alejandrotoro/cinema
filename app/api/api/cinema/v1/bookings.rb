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
        end
        get do
          @start_date = params[:start_date]
          @end_date = params[:end_date]
          bookings = Booking.get_bookings_by_dates(@start_date, @end_date)
          present bookings, with: Cinema::Entities::Booking, start_date: @start_date, end_date: @end_date
        end

      end
    end
  end
end