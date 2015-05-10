class CommentsController < ApplicationController
 

   
def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.fine(params[:post_id])
    @comment = Post.new
    authorize @comment
  end

  def create
   @topic = Topic.find(params[:id])
   @post = Post.find(params[:post_id])
   @comment = current_user.comments.build(params.require(:comment).permit(:body))
   authorize @comment

   if @comment.save
   	flash[:notice] = "Comment was saved"
   	redirect_to [@topic, @post, @summary]
   else
   	flash[:eror] = "Error creating comments. Please try again."
   	render [@topic, @post]
  end
end

