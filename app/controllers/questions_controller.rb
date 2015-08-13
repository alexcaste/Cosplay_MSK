class QuestionsController < ApplicationController
  load_and_authorize_resource

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
    @question.candidate_1 = question_params[:candidate_ids].second
    @question.candidate_2 = question_params[:candidate_ids].third
    if @question.save
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
    @candidate = Candidate.find(params[:candidate_id])
    @candidate.votes +=1
    @candidate.save
    if params[:option] == "vote_0"
      @question.vote_0 +=1
      @question.save
      flash[:notice] = "You have voted for #{@candidate.name}"
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js { }
      end
    elsif params[:option] == "vote_1"
      @question.vote_1 +=1
      @question.save
      flash[:notice] = "You have voted for #{@candidate.name}"
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js { render 'vote'}
      end
    else
    end

  end

  # def voter
  #   @question = Question.find(params[:id])
  #   check = @question.vote_check(params[:vote_0], params[:vote_1], params[:vote_2])
  #   if check == 0
  #     flash[:alert] = "Please try again.  You must choose one candidate for each category."
  #   elsif check == 1
  #     flash[:alert] = "Please try again.  You may only vote for once for each category."
  #   else
  #     @question.count_vote(params[:vote_0], @question.candidates[0])
  #     @question.count_vote(params[:vote_1], @question.candidates[1])
  #     @question.count_vote(params[:vote_2], @question.candidates[2])
  #   end
  #   redirect_to questions_path
  # end

  private
  def question_params
    #params.require(:question).permit!
    params.require(:question).permit(:name, :description, {:candidate_ids => []}, :user_id, :avatar, :candidate_1, :candidate_2)
  end
end
