class AddGuestFlgToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :guest_flg, :boolean
  end
end
