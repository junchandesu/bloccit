 FactoryGirl.define do
   factory :user do
     name "Douglas Adams"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now


     factory :user_with_post_and_coment do
     	#comments and posts have user IDs, not the other way around. 
   		
   		after(:build) do |user|
   			post = create(:post, :user user)
   			comment = crate(:comment, user: user, post: post)
   		end
  	 end
   end

   
 end

