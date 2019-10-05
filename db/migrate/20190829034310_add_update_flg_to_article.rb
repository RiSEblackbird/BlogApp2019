# frozen_string_literal: true

class AddUpdateFlgToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :update_note, :boolean, default: 0
  end
end
