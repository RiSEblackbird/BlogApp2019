class UsersController < ApplicationController
  # [devise由来] ログイン済ユーザーにのみアクセスを許可する。
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @comments = Comment.where(user_id: @user.id).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(configure_permitted_parameters)
    if @user.save
      redirect_to @user, notice: "ユーザー情報を更新しました！"
    else
      render "edit"
    end
  end
end
