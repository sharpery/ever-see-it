require 'random_data'

5.times do
  User.create!(
  name:RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

10.times do
  Label.create!(
  name: RandomData.random_word,
  )
end
lables = Label.all

15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end

topics = Topic.all

50.times do
  post = Post.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  topic: topics.sample,
  user: users.sample
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  # rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

posts = Post.all

100.times do
  Comment.create!(
  user: users.sample,
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

admin = User.create!(
name: 'Admin User',
email: 'admin@example.com',
password: 'helloworld',
role: 'admin'
)

member = User.create!(
name: 'Member User',
email: 'member@example.com',
password: 'helloworld'
)

user = User.first
user.update_attributes!(
  email: 'admin@gmail.com',
  password: "hihihi",
  role: 'admin'
)

puts "Seed finished"
puts "#{Label.count} labels created"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
