class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @uesr = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(@user.id)
  end

  def unsubscribe

  end

  def withdraw

  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :image, :experience_point, :is_active, :email)
  end


end
