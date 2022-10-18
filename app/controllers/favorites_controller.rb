class FavoritesController < ApplicationController
  # GET /favorites/1
  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id) 
  end

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path, notice: "#{favorite.post.user.name}さんの投稿をお気に入りに登録しました。"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "#{favorite.post.user.name}さんの投稿をお気に入り解除しました。"
  end

end
