class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment Added"
      redirect_to question_path(@question)
    else
      render :new
      end
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment Modified"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question)
  end

  private
   def comment_params
    params.require(:comment).permit(:body, :user_id, :question_id)
  end

end
