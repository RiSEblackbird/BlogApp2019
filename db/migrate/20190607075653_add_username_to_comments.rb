# frozen_string_literal: true

class AddUsernameToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :username, :string
  end
end
