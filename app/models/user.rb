class User < ApplicationRecord

  # Articleモデルとの関連付け
  has_many :articles, dependent: :destroy

  # プロフ写真との関連付け
  mount_uploader :image, ImageUploader

  # Userモデルに適用するdeviseの機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable, :validatable

  # Userモデルのカラムのバリデーション
  validates :username, presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }

  def resized_image
    return self.image.variant(resize: '100x100')
  end
end
