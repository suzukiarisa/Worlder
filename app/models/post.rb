class Post < ApplicationRecord

  belongs_to :user
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  has_many :post_area_relations
  has_many :areas, through: :post_area_relations
end
