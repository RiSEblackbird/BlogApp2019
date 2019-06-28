class User < ApplicationRecord

  # Article, Commentモデルとの関連付け
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy
  #has_many :followers, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article
  has_many :following_users, through: :follows, source: :user
  has_many :follower_users, through: :followers, source: :user

  def follower_user(current_id, showing_id)
    Follow.find_by(user_id: current_id, following_id: showing_id)
  end

  # プロフィール画像の適用
  has_one_attached :image

  # プロフ写真との関連付け
  mount_uploader :image, ImageUploader

  # Userモデルに適用するdeviseの機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable, :validatable

  # Userモデルのカラムのバリデーション
  validates :username, presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :profile,
    length: { maximum: 150 }

  def posted_articles
    Article.where(user_id: id).order(created_at: :desc)
  end

  scope :sidebar_limit, -> { limit(10) }
  scope :by_date, -> { order(created_at: :desc) }

#  別途要検討
#  def resized_image
#    return self.image.variant(resize: '30x30')
#  end
end
