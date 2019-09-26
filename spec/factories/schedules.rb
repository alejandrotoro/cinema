FactoryBot.define do
  factory :schedule do
    date { Date.today }
    movie
  end
end
