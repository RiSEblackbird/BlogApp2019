class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(name: params[:name], email: params[:email], password_digest: params[:password_digest])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "ユーザーの登録が完了しました。"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user, notice: "ユーザー情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "ユーザーを削除しました。"
  end
end
