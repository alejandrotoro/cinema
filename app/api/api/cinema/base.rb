module Cinema
  class Base < Grape::API
    mount Cinema::V1::Movies
    mount Cinema::V1::Bookings
    add_swagger_documentation
  end
end