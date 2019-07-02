class LikesController < ApplicationController

  def create
    set_article
    @like = Like.find_or_create_by(user_id: current_user.id, article_id: params[:article_id])
    @like.like_voter = current_user
    @article.reload
    #respond_to do |format|
    #  if @like.save
    #    format.html { redirect_to @article, notice: 'いいねしました！' }
    #    format.js
    #    format.json { render json: @article, status: :created, location: @article }
    #  else
    #    format.html { redirect_to @article, notice: 'いいねに失敗しました。' }
    #  end
    #end
    #if @like.save
    #  flash[:notice] = "いいねしました！"
    #  redirect_back(fallback_location: root_path)
    #else
    #  flash[:notice] = "いいねに失敗しました。"
    #  redirect_back(fallback_location: root_path)
    #end
  end

  def destroy
    set_article
    like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
    like.destroy
    @article.reload
    #respond_to do |format|
    #  if @like.destroy
    #    format.html { redirect_to @article, notice: 'いいねを取り消しました。' }
    #    format.js
    #    format.json { render json: @article, status: :destroyed, location: @article }
    #  else
    #    format.html { redirect_to @article, notice: 'いいねの取り消しに失敗しました。' }
    #  end
    #end
    #if @like.destroy
    #  flash[:notice] = "いいねを取り消しました。"
    #  redirect_back(fallback_location: root_path)
    #else
    #  flash[:notice] = "いいねの取り消しに失敗しました。"
    #  redirect_back(fallback_location: root_path)
    #end
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
