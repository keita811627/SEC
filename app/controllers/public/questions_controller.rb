class Public::QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def index

  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    redirect_to public_question_path(@question.id)
  end

  def destroy

  end

  private

  def question_params
   params.require(:question).permit(:user_id, :genre_id, :question_status_id, :title, :body)
  end

end
