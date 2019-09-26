module Cinema
  module V1
    class Movies < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :movies do
        desc 'Return list of movies'
        params do
          optional :date, type: Date, desc: 'Date to search movies'
        end
        get do
          @date = params[:date]
          movies = Movie.get_movies_by_date(@date)
          present movies, with: Cinema::Entities::Movie, date: @date
        end

        desc 'Create a movie.'
        params do
          requires :movie, type: Hash do
            requires :name, type: String, desc: 'Movie Name'
            requires :description, type: String, desc: 'Movie Description'
          end
          requires :schedule, type: Hash do
            requires :date, type: DateTime, desc: "Schedule Date"
          end
        end
        post do
          @date = params[:schedule][:date]
          movie = Movie.new(params[:movie])
          if movie.save
            schedule = Schedule.create!(date: params[:schedule][:date], movie: movie)
            present movie, with: Cinema::Entities::Movie, date: @date
          else
            error!({ error: movie.errors.full_messages }, 401)
          end
        end

      end
    end
  end
end