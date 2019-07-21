class Api::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end
