class Article < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    Likes.find_by(user_id: user_id)
  end

  validates :title, :body, presence: true
  validates :tag_list, length: { maximum: 20 }
  validates :title, length: { maximum: 100 }
  validates :body, length: { maximum: 5000 }
end
