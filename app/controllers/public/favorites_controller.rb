class Public::FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.new(answer_id: params[:answer_id])
    @favorite.save
    redirect_to public_question_path(params[:question_id])
  end

  def destroy
    @favorite = current_user.favorites.find_by(answer_id: params[:answer_id])
    @favorite.destroy
    redirect_to public_question_path(params[:question_id])
  end

end
