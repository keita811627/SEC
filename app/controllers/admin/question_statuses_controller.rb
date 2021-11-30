class Admin::QuestionStatusesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @question_status = QuestionStatus.new
  end

  def create
    @question_status = QuestionStatus.new(question_status_params)
    @question_status.save
    redirect_to admin_question_statuses_path
  end

  def index
    @question_statuses = QuestionStatus.all

  end

  def edit
    @question_status = QuestionStatus.find(params[:id])
  end

  def update
    @question_status = QuestionStatus.find(params[:id])
    @question_status.update(question_status_params)
    redirect_to admin_question_statuses_path
  end

  private

  def question_status_params
   params.require(:question_status).permit(:status)
  end

end
