class RenameAuthornameColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :authorname, :username
  end
end
