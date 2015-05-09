class SummariesController < ApplicationController
  def index
  	@summaries = Summary.all
  	authorize @summaries
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def show
  	@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])    
    @summary = Summary.find(params[:id])
	   authorize @summary
  end

   def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
   	@summary = Summary.find(params[:id])
	authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
   	@summary = current_user.@post.build(params.require(:summary).permit(:body))
  	@summary.body = @post	
     authorize @summary
  	
    if @summary.save
        flash[:notice] = "Summary was saved."
  		redirect_to [@topioc, @post, @summary], notice: "Summary was saved successfully."
  	else
  		flash[:error] = "Error creating summary. Please try again."
  		render :new
  	end
  end


 # def create
 #    @topic = Topic.find(params[:topic_id])
 #    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
 #    @post.topic = @topic
 #    authorize @post

 #    if @post.save
 #      flash[:notice] = "Post was saved."
 #      redirect_to [@topic, @post]
 #    else
 #      flash[:error] = "There was an error saving the post. Please try again."
 #      render :new
 #    end
 #  end



 def update
  @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  	@summary = Summary.find(params[:id])
  		authorize @summary

  	if @summary.update_attributes(params.require(:summary).permit(:body))
  		redirect_to [@topic, @post, @summary], notice: "Summary was updated successfully."
  	else
  		flash[:error] = "Error updating summary. Please try again."
  		render :edit
  	end

  end
  
end
