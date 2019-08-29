class AddUpdateFlgToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :update_note, :boolean
  end
end
