class PostsController < ApplicationController

before_action :flash_attack
skip_before_action :flash_attack, only: [:new, :index]

  def flash_attack
    flash[:set] = "Flash is set before Post Contoller"
  end

  def index
    #@posts = policy_scope(Post.includes(:user).all)
  	#@posts = Post.all
    @posts = policy_scope(Post) 
    authorize @posts
  end

 

def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end


  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @summaries = @post.summary
    authorize @post
  end

<<<<<<< HEAD
  def create
<<<<<<< HEAD

#    @post = Post.new(params.require(:post).permit(:title, :body))
@post = current_user.posts.build(params.require(:post).permit(:title, :body))
=======
    @topic = Topic.find(params[:topic_id])
>>>>>>> hw-34
    @post = Post.new(params.require(:post).permit(:title, :body))
=======



 def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
>>>>>>> hw-37-markdown
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end



   def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
     @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

private

def post_params
  params.require(:post).permit(:title, :body)
end
  
  end

