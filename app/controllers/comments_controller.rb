class CommentsController < ApplicationController
 

   
def new
   # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  #  authorize @comment
 end

def create
 #  @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id])
   @comment = @post.comments
   @comment = current_user.comments.build(comment_params)
   @comment.post = @post

   @new_comment = Comment.new
   authorize @comment

   if @comment.save
    flash[:notice] = "Comment was saved"
    #redirect_to [@post.topic, @post]
   else
    flash[:error] = "There was an error saving the comment."
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
   end

     respond_to do |format|
       format.html
       format.js
     end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

end