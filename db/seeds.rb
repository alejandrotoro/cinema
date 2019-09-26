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

30.times do |index|
  schedule_id = rand(1..Schedule.all.count)
  user_id = rand(1..User.all.count)
  Booking.create!(schedule_id: schedule_id, user_id: user_id)
end