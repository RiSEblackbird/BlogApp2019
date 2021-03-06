# frozen_string_literal: true

class AddGuestFlgToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :guest_flg, :boolean, default: 0
  end
end
