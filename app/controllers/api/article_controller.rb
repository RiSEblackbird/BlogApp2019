class Api::ArticleController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(8).order(created_at: :desc)

    respond_to do |format|
      format.html { render :index }
      format.json { render 'index.json.jbuilder' }
    end
  end

  def show
    @article = Article.find(params[:id])
    @like = Like.find_by(user_id: current_user.id, article_id: params[:id])
    @likes = @article.likes.where(article_id: params[:article_id])
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end
