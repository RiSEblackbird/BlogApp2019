class ArticlesController < ApplicationController
  # [devise由来] ログイン済ユーザーにのみアクセスを許可する。
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    @comments = @article.comments.order(created_at: :desc)
    @like = @article.likes.new
    @likes = @article.likes.where(article_id: params[:article_id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.author = current_user
    if @article.save
      redirect_to @article, notice: "記事を投稿しました！"
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    if @article.save
      redirect_to @article, notice: "記事内容を更新しました！"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :articles
  end


  private

   def article_params
     params.require(:article).permit(:title, :body, :tag_list)
   end
end
