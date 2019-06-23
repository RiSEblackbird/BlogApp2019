class User < ApplicationRecord

  # Article, Commentモデルとの関連付け
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :likes
  has_many :liked_articles, through: :likes, source: :article

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

#  別途要検討
#  def resized_image
#    return self.image.variant(resize: '30x30')
#  end
end
