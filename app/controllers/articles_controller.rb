class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @article = Article.order(released_at: :desc)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Aritcle.find(params[:id])
  end

  def create
    @article = Article.new(params[:id])
    if @article.save
      redirect_to @article, notice: "記事を投稿しました！"
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])
    if @article.save
      redirect_to @article, notice: "記事内容を更新しました！"
    else
      render "edit"
    end
  end

end
