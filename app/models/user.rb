class User < ApplicationRecord

  # Article, Commentモデルとの関連付け
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id",
           class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id",
           class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :liked_articles, through: :likes, source: :article

  # プロフィール画像の適用
  has_one_attached :image
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

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(follower_id: other_user.id)
  end

  scope :sidebar_limit, -> { limit(10) }
  scope :by_date, -> { order(created_at: :desc) }

end
