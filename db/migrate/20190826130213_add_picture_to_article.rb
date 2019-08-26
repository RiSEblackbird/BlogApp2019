class AddPictureToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :article_picture, :string
  end
end
