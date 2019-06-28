class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @follow = Follow.create(user_id: current_user.id, following_id: @user.id)
    @follow.follower = current_user
    @follows = Follow.where(following_id: params[:following_id])
    if @follow.save
      flash[:notice] = "フォローしました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "フォローに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.find_by(user_id: current_user.id, following_id: @user.id)
    @follow.destroy
    if @follow.destroy
      flash[:notice] = "フォローを解除しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "フォローの解除に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end
end
