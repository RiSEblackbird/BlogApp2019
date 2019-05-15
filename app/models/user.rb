class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable, :validatable
  validates :username, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true, message: :invalid_user_username },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
end
