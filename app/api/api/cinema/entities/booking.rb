module Cinema
  module Entities
    class Booking < Grape::Entity
      expose :schedule, using: Cinema::Entities::ScheduleMovie
      expose :user, using: Cinema::Entities::User
      expose :start_date, :if => lambda { |_object, options| options[:start_date] } do |_object, options|
        options[:start_date]
      end
      expose :end_date, :if => lambda { |_object, options| options[:end_date] } do |_object, options|
        options[:end_date]
      end
    end
  end
end