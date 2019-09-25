module Cinema
  module V1
    class Movies < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api
      resource :movies do
        desc 'Return list of movies'
        get do
          movies = Movie.all
          present movies
        end
      end
    end
  end
end