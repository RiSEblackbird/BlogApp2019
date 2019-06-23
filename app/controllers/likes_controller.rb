class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, article_id: params[:article_id])
    @like.like_voter = current_user
    @likes = Like.where(article_id: params[:article_id])
    if @like.save
      flash[:notice] = "いいねしました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "いいねに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    @like.destroy
    if @like.destroy
      flash[:notice] = "いいねを取り消しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "いいねの取り消しに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end
end
