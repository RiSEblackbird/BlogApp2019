class Article < ApplicationRecord
  validates :title, :body, :released_at, presence: true
  validates :category, length: { maximum: 30 }
  validates :title, length: { maximum: 100 }
  validates :body, length: { maximum: 5000 }
end
