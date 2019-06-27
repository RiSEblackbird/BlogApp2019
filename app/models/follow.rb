class Follow < ApplicationRecord
  belongs_to :user, :counter_cache => :follow_count
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
end
