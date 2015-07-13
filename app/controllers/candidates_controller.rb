class CandidatesController < ApplicationController

  before_action :authenticate_user!

  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = "Candidate Created"
      redirect_to candidate_path(@candidate)
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      flash[:notice] = "Candidate Modified"
      redirect_to candidate_path(@candidate)
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to candidates_path
  end

  private
    def candidate_params
      params.require(:candidate).permit(:name, :avatar, :marry_score, :screw_score, :kill_score, :question_id, :user_id)
    end
end
