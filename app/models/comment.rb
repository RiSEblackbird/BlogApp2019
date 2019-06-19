class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :commenter, class_name: "User", foreign_key: "user_id"
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  validates :content, length: { maximum: 500 }, presence: true
end
