class PostsController < ApplicationController

skip_before_action :flash_attack, only: [:new, :index]

  def flash_attack
    flash[:set] = "Flash is set before Post Contoller"
  end

  def index
  	@posts = Post.all
    authorize @posts
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    authorize @post
    if @post.save
      flash[:notice] = "Post was save."
      redirect_to @post
     else
      flash[:error] = "There was an error saving the post. Plesae try again."
      render :new
    end
  end

  def edit
      @post = Post.find(params[:id])
      authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end
