# frozen_string_literal: true

class AddAdminFlgToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_flg, :boolean, default: 0
  end
end
