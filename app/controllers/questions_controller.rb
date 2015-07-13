class QuestionsController < ApplicationController

  def index

  end

  def new
    @question = Question.new
    @candidates = Candidate.all
  end

end
