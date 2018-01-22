require "../config/application.cr"
require "faker"

User.clear
userCount = Faker::Number.between(3, 10)
i = 0
while i < userCount
  user = User.new
  user.email = "admin#{i}@example.com"
  user.password = "password"
  user.save
  i += 1
end

# Category
puts "Seeding Categories"
Category.clear
categoryCount = Faker::Number.between(1, 3)
i = 0
while i < categoryCount
  category = Category.new
  category.name = Faker::Lorem.word
  category.save
  i += 1
end

# Post
puts "Seeding Posts"
Post.clear
postCount = Faker::Number.between(10, 20)
i = 0;
while i < postCount
  post = Post.new
  post.title = Faker::Lorem.sentence
  post.body = Faker::Lorem.sentence(5, true)
  post.save
  i += 1
end

# Comments
# puts "Seeding Categories"
PostComment.clear
