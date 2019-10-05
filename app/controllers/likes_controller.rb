# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    set_article
    @like = Like.find_or_create_by(user_id: current_user.id, article_id: params[:article_id])
    @like.like_voter = current_user
    @article.reload
    # respond_to do |format|
    #  format.js {flash[:notice] = "いいねしました！" }
    # end
  end

  def destroy
    set_article
    like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    like.destroy
    @article.reload
    # respond_to do |format|
    #  format.js {flash[:notice] = "いいねを解除しました。" }
    # end
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
