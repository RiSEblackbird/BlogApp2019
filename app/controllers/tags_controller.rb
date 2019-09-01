class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.page(params[:page]).per(8).order(name: :asc)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.all.find(params[:id])
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.all.find(params[:id])
  end

  def update
    @tag = ActsAsTaggableOn::Tag.all.find(params[:id])
    @tag.assign_attributes(tag_params)
    if @tag.save
      redirect_to tag_path(params[:id]), notice: "タグの情報を更新しました！"
    else
      render "edit"
    end
  end

  def destroy
    @tag = ActsAsTaggableOn::Tag.all.find(params[:id])
    @tag.destroy
    redirect_to controller: 'tags', action: 'index'
  end

  private

   def tag_params
     params.require(:tag).permit(:description)
   end
end
