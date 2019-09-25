class Schedule < ApplicationRecord
  belongs_to :movie

  def self.get_movies_by_date(date)
    schedules = Schedule.where(date: date.beginning_of_day..date.end_of_day).all
    movie_ids = schedules.map(&:movie_id)
    Movie.find(movie_ids)
  end
end
