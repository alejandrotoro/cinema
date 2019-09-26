FactoryBot.define do
  factory :schedule do
    date { Date.today + 2.days }
    movie
  end
end
