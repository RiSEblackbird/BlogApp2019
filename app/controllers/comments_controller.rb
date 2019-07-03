class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    set_article
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.commenter = current_user
    @comment.save
    set_comments
  end

  def destroy
    set_article
    set_comments
    @comment = @article.comments.find(params[:id])
    @comment.destroy
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comments
    @comments = @article.comments.where(article_id: params[:article_id]).order(created_at: :asc)
  end

  private

   def comment_params
     params.require(:comment).permit(:content)
   end
end
