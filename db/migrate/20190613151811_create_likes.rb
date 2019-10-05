# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
