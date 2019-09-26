class Movie < ApplicationRecord
  has_many :schedules
  validates_presence_of :name, :description
  
  # has_one_attached :image

  def self.get_movies_by_date(date)
    if date.present?
      Schedule.get_movies_by_date(date)
    else
      Movie.all
    end
  end
end
