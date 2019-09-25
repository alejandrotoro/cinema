# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  User.create!(first_name: Faker::FunnyName.name, last_name: Faker::FunnyName.name, email: Faker::Internet.email)
  Movie.create!(name: Faker::FunnyName.three_word_name, description: Faker::Quote.famous_last_words)
end

30.times do |index|
  movies = Movie.all
  movies.each do |movie|
    Schedule.create!(date: (DateTime.now.beginning_of_day + index.days + (index + 16).hours), movie: movie)
  end
end