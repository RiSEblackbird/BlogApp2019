class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :content, length: { maximum: 500 }, presence: true
end
