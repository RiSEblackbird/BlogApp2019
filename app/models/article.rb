class Article < ApplicationRecord
  acts_as_taggable
  belongs_to :user, :counter_cache => :article_count
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def like_user(user)
    likes.find_by(user_id: user)
  end

  # 記事画像の適用
  has_one_attached :article_picture
  mount_uploader :article_picture, ImageUploader

  validates :title, :body, presence: true
  validates :tag_list, length: { maximum: 20 }
  validates :title, length: { maximum: 100 }
  validates :body, length: { maximum: 20000 }

  scope :sidebar_limit, -> { limit(10) }
  scope :by_dates, -> { order(created_at: :desc) }
  scope :by_comments, -> { order(comment_count: :desc) }
  scope :update_notice, -> { where(update_note: true) }
end
