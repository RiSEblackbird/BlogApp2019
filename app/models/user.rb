class User < ApplicationRecord

  # Articleモデルとの関連付け
  has_many :articles, dependent: :destroy

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

#  def resized_image
#    return self.image.variant(resize: '30x30')
#  end
end
