class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @article = Article.find_by(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.username = current_user.username
    if @comment.save
      flash[:notice] = "コメントを投稿しました！"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメントの投稿に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:article_id])
    @comment.destroy
    if @comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメントの削除に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

   def comment_params
     params.require(:comment).permit(:content)
   end
end
