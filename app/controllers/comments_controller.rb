class CommentsController < ApplicationController
 

   
def new
    #@topic = Topic.find(params[:topic_id])
    @post = Post.fine(params[:post_id])
    @comment = Comment.new
    authorize @comment
 end

def create
   #@topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id])
   @comment = current_user.comments.build(params.require(:comment).permit(:body))
   authorize @comment

   if @comment.save
   	flash[:notice] = "Comment was saved"
   	#redirect_to [@topic, @post]
    redirect_to @post
   else
   	flash[:error] = "Error creating comments. Please try again to enter at least 5 letters."
   	#redirect_to [@topic, @post]
    redirect_to @post
   end
end


def destroy
  #@topic = Topic.find(params[:topic_id])
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])

  authorize @comment
  if @comment.destroy
    flash[:notice] = "Comment was removed."
    #redirect_to [@topic, @post]
    redirect_to @post
  else
    flash[:error] = "Comment could not be deleted. Try again."
    #redirect_to [@topic, @post]
    redirect_to @post 
  end
end
end
