class Movie < ApplicationRecord
  has_many :schedules

  def self.get_movies_by_date(date)
    if date.present?
      Schedule.get_movies_by_date(date)
    else
      Movie.all
    end
  end
end
