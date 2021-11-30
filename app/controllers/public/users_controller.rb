class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update]

  def index
    @users = User.all.order(experience_point: "DESC")
  end

  def show
    @user = User.find(params[:id])
    @user_questions = @user.questions
    @answer = @user.answers.count
    @favorite = @user.answers.joins(:favorites).count
    @user.experience_point = @favorite
    if @user.experience_point <= 5
      @level = 1
    elsif @user.experience_point >= 5
      @level = 0 + @user.experience_point / 5
    end
    @user.save

  end

  def search
    @user = current_user
    @user_questions = current_user.questions.search(params[:keyword])
    @keyword = params[:keyword]
    render "show"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :image, :experience_point, :is_active, :email)
  end

  def check_user
    @user = User.find(params[:id])
    redirect_to public_user_path(current_user.id) unless @user == current_user
  end

end
