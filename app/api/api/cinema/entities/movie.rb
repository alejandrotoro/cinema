module Cinema
  module Entities
    class Movie < Grape::Entity
      expose :name
      expose :description
      expose :image
      expose :date, :if => lambda { |movie, options| options[:date] } do |movie, options|
        options[:date]
      end
      # expose :schedules, using: Cinema::Entities::Schedule
    end
  end
end