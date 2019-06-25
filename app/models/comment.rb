class Comment < ApplicationRecord
  belongs_to :user, :counter_cache => :comment_count
  belongs_to :article, :counter_cache => :comment_count
  belongs_to :commenter, class_name: "User", foreign_key: "user_id"
  has_many :likes, dependent: :destroy

  validates :content, length: { maximum: 500 }, presence: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
