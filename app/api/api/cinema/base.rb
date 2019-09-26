module Cinema
  class Base < Grape::API
    mount Cinema::V1::Movies
    add_swagger_documentation
  end
end