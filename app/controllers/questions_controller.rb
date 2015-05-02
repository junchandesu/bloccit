class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def edit
  	 @question = Question.find(params[:id])
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(params.require(:question).permit(:title, :body, :resolved))
 
    
  	if @question.save
  		flash[:notice] = "Post was saved."
  		redirect_to @question
  	else
  		flash[:error] = "There was an error saving the post. Please try again."
  		render :new
  	end
	end


  def update
    @question= Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Post was updated."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
  	@question = Question.find(params[:id])
  	if @question.delete
  		redirect_to questions_path
  	elsif 
  		flash[:error] = "You failed to delete the question."
  		render :show
  	end
  		
  end
end




