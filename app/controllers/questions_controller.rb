class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
    @candidates = Candidate.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:alert] = "Question Added"
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @candidates = Candidate.all
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question Modified"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit!
    # params.require(:question).permit(:name, :description, :candidate_ids, :user_id)
  end
end
