class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag = ActsAsTaggableOn::Tag.all.find(params[:id])
  end

  def edit
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  def update
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag.assign_attributes(tag_params)
    if @tag.save
      redirect_to @tag, notice: "タグの情報を更新しました！"
    else
      render "edit"
    end
  end

  private

   def tag_params
     params.require(:tag).permit(:description)
   end
end
