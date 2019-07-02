class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:following_id])
    @relationship = current_user.follow!(@user)
    @relationship.save
    if @relationship.save
      flash[:notice] = @user.username += "さんをフォローしました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = @user.username += "さんのフォローに失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).follower
    followed = Relationship.find(params[:id]).following
    @relationship = current_user.unfollow!(@user)
    @relationship.destroy
    if @relationship.destroy
      flash[:notice] = followed.username += "さんのフォローを解除しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = followed.username += "さんのフォローの解除に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end
end
