# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  user = User.create(email: Faker::Internet.email,
              password: 'foobar')
  20.times do
    user.posts.create(content: Faker::Lorem.sentence)
  end
end

admin = User.create(email: 'slowmanchan@gmail.com',
            password: 'foobar')

posts = Post.all

50.times do
  post = admin.posts.create(content: Faker::Lorem.sentence)
    posts.each do |post|
      post.comments.create(content: Faker::Lorem.sentence, user_id: admin.id)
    end
end
