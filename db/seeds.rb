require 'faker'

# #50.times   do 
# # 	Post.create!(
# # 		title: Faker::Lorem.sentence,
# # 		body: Faker::Lorem.paragraph
# # 		)
# # #end
# posts = Post.all

# 1#00.times do 
# 	Comment.create!(
# 		post: posts.sample,
# 		body: Faker::Lorem.paragraph
# 		)
# #end

# puts "Seed finished"
# puts "#{Post.count} posts created"
# puts "#{Comment.count} comments crated"


<<<<<<< HEAD
post1 = "Orange Banana"
body1 = "Good morning. Good afternoon. Good night"

if Post.select { |x| x.title != post1 } && Post.select { |y| y.body != body1}
Post.create!(
	title: post1,
	body: body1
	)
puts "The new unique post title: '#{post1}'and body: '#{body1}' are added."
puts "In posts table, #{Post.count} posts are in total"
end
=======
# post1 = "Orange Banana Apple"
# body1 = "Good morning. Good afternoon. Good night!!"


# if Post.select { |x| x.title != post1 } && Post.select { |y| y.body != body1}
# Post.create!(
# 	title: post1,
# 	body: body1
# 	)
# puts "The new unique post title: '#{post1}'and body: '#{body1}' are added."
# puts "In posts table, #{Post.count} posts are in total"
# end

post1 = "Orange Banana Apple"
body1 = "Good morning. Good afternoon. Good night!!"
post_title = Post.where(title: post1).first
post_body = Post.where(body: body1).first

if !post_title && !post_body
	Post.create!(
	title: post1,
	body: body1
	)
puts "The new unique post title: '#{post1}'and body: '#{body1}' are added."
puts "In posts table, #{Post.count} posts are in total"
else
	puts "Nothing is added"
end

>>>>>>> faker-seed

