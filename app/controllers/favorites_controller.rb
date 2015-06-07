class FavoritesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: post)
		authorize favorite
		if favorite.save
			flash[:notice] = "Favorite is saved successfully."
			redirect_to [post.topic, post]
		else
			flash[:error] = "Sorry, but favorite is not saved."
			redirect_to [post.topic, post]
		end

	end

	def destroy

		post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: post)
		authorize favorite

		if favorite.destroy
			flash[:notice] = "Unfavorite is successfully saved."
			redirect_to [post.topic, post]
		else
			flash[:error] = "Sorry but it has not be changed to Unfavored status."
			redirect_to [post.topic, post]
		end

	end

end
