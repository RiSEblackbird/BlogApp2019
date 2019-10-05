# frozen_string_literal: true

class RemoveUsernameFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :username, :string
  end
end
