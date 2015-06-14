class CommentsController < ApplicationController
 
respond_to :html, :js
   
def new
   # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  #  authorize @comment
 end

def create
 #  @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id])
   @comment = current_user.comments.build(params.require(:comment).permit(:body))
   @comment.post = @post
   @new_comment = Comment.new
   authorize @comment

   if @comment.save
    flash[:notice] = "Comment was saved"
    redirect_to [@post.topic, @post]
   else
    render :new
   end
end


   def destroy
  #   @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     authorize @comment
     
     if @comment.destroy
       flash[:notice] = "Comment was removed."
      #redirect_to [@post.topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       #redirect_to [@post.topic, @post]
     end

     respond_with(@comment) do |format|
       format.html{ redirect_to [@post.topic, @post]}
       
     end
    end
end