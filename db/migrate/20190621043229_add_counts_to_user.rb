class AddCountsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :follow_count, :integer, default: 0
    add_column :users, :follower_count, :integer, default: 0
    add_column :users, :like_count, :integer, default: 0
    add_column :users, :stock_count, :integer, default: 0
  end
end
