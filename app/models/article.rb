class Article < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :tag_list, length: { maximum: 20 }
  validates :title, length: { maximum: 100 }
  validates :body, length: { maximum: 5000 }
end
