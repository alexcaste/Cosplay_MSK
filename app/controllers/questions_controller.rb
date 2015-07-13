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
    @candidates = Candidate.all
    @question = Question.new(question_params)
    if @question.candidates.length != 3
      flash[:alert] = "A question must contain exactly 3 candidates"
      render :new
    elsif @question.save
      flash[:notice] = "Question Added"
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

  def vote
    @question = Question.find(params[:id])
    binding.pry

    @question.count_vote(params[:vote_0], @question.candidates[0])
    @question.count_vote(params[:vote_1], @question.candidates[1])
    @question.count_vote(params[:vote_2], @question.candidates[2])

  end

  private
  def question_params
    params.require(:question).permit!
    # params.require(:question).permit(:name, :description, :candidate_ids, :user_id)
  end
end
