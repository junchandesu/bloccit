require 'rails_helper'

describe User do 

	include TestFactories

	describe "#favorited(post)" do
		before do
			@post = associated_post
			@user = authenticated_user
			
		end

	
		it "returns 'nil' if the user has not favorited the post" do
	   		expect(@user.favorited(@post)).to be_nil

	   end

		it "Retrns the appropriate favorite if it exists" do
			favorite = @user.favorites.where(post_id: @post.id).first
		expect( @user.favorited(@post)).to eq(favorite)
		end
	end
end

