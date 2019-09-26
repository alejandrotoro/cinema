module Cinema
  module Entities
    class User < Grape::Entity
      expose :first_name
      expose :last_name
      expose :email
    end
  end
end