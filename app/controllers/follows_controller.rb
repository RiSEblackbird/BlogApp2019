class FollowsController < ApplicationController
  def create
    @follow = Follow.create(user_id: current_user.id, following_id: params[:following_id])
    @follow.follower = current_user
    @follows = Follow.where(user_id: params[:user_id])
    if @follow.save
      flash[:notice] = "いいねしました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "いいねに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @follow = Follow.find_by(user_id: current_user.id, following_id: params[:following_id])
    @follow.destroy
    if @follow.destroy
      flash[:notice] = "いいねを取り消しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "いいねの取り消しに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end
end
