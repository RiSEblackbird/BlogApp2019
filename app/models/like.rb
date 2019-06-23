class Like < ApplicationRecord
  belongs_to :user, :counter_cache => :like_count
  belongs_to :article, :counter_cache => :like_count
  belongs_to :like_voter, class_name: "User", foreign_key: "user_id"
end
