class FavoritesController < ApplicationController

  
  def create
    favorite = current_user.favorites.create(sake_id: params[:sake_id])
    redirect_to sakes_path, notice: "#{favorite.sake.user.email}さんの投稿をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to sakes_path, notice: "#{favorite.sake.user.email}さんの投稿をお気に入り解除しました"
  end
end
