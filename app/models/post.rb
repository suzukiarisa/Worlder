class Post < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, length: { maximum: 100 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  attachment :image
end
