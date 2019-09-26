class Schedule < ApplicationRecord
  belongs_to :movie
  has_many :bookings

  def self.get_movies_by_date(date)
    schedules = Schedule.where(date: date.beginning_of_day..date.end_of_day).all
    movie_ids = schedules.map(&:movie_id)
    Movie.find(movie_ids)
  end

  def self.get_bookings_by_dates(start_date, end_date)
    schedules = Schedule.where(date: start_date.beginning_of_day..end_date.end_of_day).all
    schedules.map(&:bookings).flatten
  end
end
