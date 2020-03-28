class Area < ApplicationRecord

  has_many :post_area_relations
  has_many :posts, through: :post_area_relations
end
