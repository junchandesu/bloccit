require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


 # Create Topics
 150.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

# Create Posts
400.times do
 post = Post.create!(
     user:   users.sample,
     topic:      topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    
  )

   # set the created_at to a time within the past year
   post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
   post.create_vote
   post.update_rank
end
posts = Post.all

150.times do
  Summary.create!(
   post: posts.sample,
    body: Faker::Lorem.sentence
  )
end
summaries = Summary.all



# Create Comments
300.times do
  Comment.create!(
    user: users.sample,   # we have not yet associated Users with Comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end


 # user = User.first
 # user.skip_reconfirmation!
 # user.update_attributes!(
 #   email: 'chuckyee@hotmail.com',
 #   password: 'alicia16'
 # )
 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Summary.count} summary created"
puts "#{Comment.count} comments created"