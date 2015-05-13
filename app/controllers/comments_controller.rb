class CommentsController < ApplicationController
 

   
def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
#    authorize @comment
 end

def create
   @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id])
   @comment = current_user.comments.build(params.require(:comment).permit(:body))
   @comment.post = @post
   authorize @comment

   if @comment.save
   	flash[:notice] = "Comment was saved"
   	redirect_to [@topic, @post]
   else
   	flash[:error] = "Error creating comments. Please try again to enter at least 5 letters."
   	redirect_to [@topic, @post]
   end
end
end
