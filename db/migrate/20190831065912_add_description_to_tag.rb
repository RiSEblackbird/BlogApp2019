class AddDescriptionToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :description, :text
  end
end
