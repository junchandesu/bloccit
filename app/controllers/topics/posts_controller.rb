class Topics::PostsController < ApplicationController

#before_action :flash_attack
#skip_before_action :flash_attack, only: [:new, :index]

  def flash_attack
    flash[:set] = "Flash is set before Post Contoller"
  end

  def index
    @posts = Post.all
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
    @comments = @post.comments
    authorize @post
  end




  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save
      #@post.create_vote
      @post.save_with_initial_vote
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

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post


    if @post.destroy
      flash[:notice] ="\"#{@post.title}\" was deleted successfully "
      redirect_to @topic
    else
      flash[:error] = "Comment could not be deleted. Try again"
      redirect_to [@topic, @post]
    end

  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :picture_cache, :picture)
  end
  

end
