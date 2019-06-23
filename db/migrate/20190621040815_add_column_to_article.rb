class AddColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :like_count, :integer, default: 0
    add_column :articles, :comment_count, :integer, default: 0
    add_column :articles, :stock_count, :integer, default: 0
  end
end
