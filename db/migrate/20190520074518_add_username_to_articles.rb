class AddUsernameToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :username, :string
  end
end
