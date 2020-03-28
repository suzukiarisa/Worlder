class Post < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, length: { maximum: 100 }

  belongs_to :user
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  has_many :post_area_relations
  has_many :areas, through: :post_area_relations

  attachment :image
end
