class Public::AnswersController < ApplicationController

  def create
     @question = Question.find(params[:question_id])
     @answer = current_user.answers.new(answer_params)
     @answer.question_id = @question.id
     if @answer.save
         redirect_to public_question_path(params[:question_id])
     else
         redirect_to public_question_path(params[:question_id])
     end
  end

  def destroy

  end

   private

  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end

end
