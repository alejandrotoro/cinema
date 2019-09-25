module Cinema
  class Base < Grape::API
    mount Cinema::V1::Movies
  end
end