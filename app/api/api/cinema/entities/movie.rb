module Cinema
  module Entities
    class Movie < Grape::Entity
      expose :name
      expose :description
      expose :image
    end
  end
end