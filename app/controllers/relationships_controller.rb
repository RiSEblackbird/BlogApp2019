class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:relationship][:following_id])
    @relationship = current_user.follow!(@user)
    @user.reload
  end

  def destroy
    @user = Relationship.find(params[:id]).follower
    #p "@user >>> ", @user
    followed = Relationship.find(params[:id]).following
    #p "followed >>> ", followed
    #p "current_user.following_relationships.find_by(follower_id: current_user.id)", current_user.following_relationships.find_by(follower_id: current_user.id)
    @relationship = current_user.unfollow!(current_user)
    #p "@relationship >>> ", @relationship
    @relationship.destroy
    @user = User.find(params[:id])
    #p "@user >>> ", @user
  end
end
