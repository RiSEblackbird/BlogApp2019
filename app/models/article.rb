class Article < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  validates :category, length: { maximum: 30 }
  validates :title, length: { maximum: 100 }
  validates :body, length: { maximum: 5000 }
end
