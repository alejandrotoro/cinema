module Cinema
  module Entities
    class ScheduleMovie < Grape::Entity
      format_with(:time) { |date| date.strftime('%Y/%m%d %l:%M %p') }
      with_options(format_with: :time) do
        expose :date
      end
      expose :movie, using: Cinema::Entities::Movie
    end
  end
end