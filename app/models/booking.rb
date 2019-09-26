class Booking < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates_uniqueness_of :user, scope: :schedule
  validate :booking_limit, on: :create
 
  def booking_limit
    size = Booking.where(schedule_id: schedule.id).all.size
    errors.add(:booking_limit, "Is not possible to create bookings for this schedule, it exceeds the booking limit of 10") if size >= 10
  end

  def self.get_bookings_by_dates(start_date, end_date)
    Schedule.get_bookings_by_dates(start_date, end_date)
  end
end
