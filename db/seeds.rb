# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create!(fullname: Faker::StarWars.character, email: Faker::Internet.email, handle: Faker::Internet.user_name)
  5.times do
    Tweet.create!(body: Faker::Lorem.paragraph[0..139], user_id: user.id)
  end
end
