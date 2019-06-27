class Follower < ApplicationRecord
  belongs_to :user, :counter_cache => :follower_count
end
