class Public::QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def index
    @questions = Question.all

  end

  def search
  @questions = Question.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
    redirect_to public_question_path(@question.id)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.user_id = current_user.id
    @question.update(question_params)
    redirect_to public_question_path(@question.id)
  end

  def destroy

  end

  private

  def question_params
   params.require(:question).permit(:user_id, :genre_id, :question_status_id, :title, :body)
  end

end
