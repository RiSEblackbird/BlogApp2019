class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:relationship][:following_id])
    @relationship = current_user.follow!(@user)
    @user.reload
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    @relationship = current_user.unfollow!(@user)
    @relationship.destroy
    @user.reload
  end
end
