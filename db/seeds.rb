# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  User.create(email: Faker::Internet.email,
              password: 'foobar')
end

20.times do
  Post.create(user_id: 1,
              content: Faker::Lorem.sentence)
end

20.times do
  Post.create(user_id: 2,
              content: Faker::Lorem.sentence)
end

20.times do
  Post.create(user_id: 3,
              content: Faker::Lorem.sentence)
end

20.times do
  Post.create(user_id: 4,
              content: Faker::Lorem.sentence)
end
