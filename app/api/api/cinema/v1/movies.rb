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
          movies = Movie.get_movies_by_date(params[:date])
          present movies, with: Cinema::Entities::Movie
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
          byebug
          movie = Movie.create!(params[:movie])
          schedule = Schedule.create!(date: params[:schedule][:date], movie: movie)
          present movie, with: Cinema::Entities::Movie
        end

      end
    end
  end
end