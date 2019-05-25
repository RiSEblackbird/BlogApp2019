class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable, :validatable
  validates :username, presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
end
