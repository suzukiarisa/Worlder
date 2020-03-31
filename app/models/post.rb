class Post < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, length: { maximum: 100 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations

  attachment :image

  scope :by_any_texts, (lambda do |string|
    string.split(' ').inject(self) do |scope, text|
      query = search(title_or_body_or_comments_body_cont_any: text).result
      scope.merge(query)
    end
  end)

  def self.ransackable_scopes(_user = nil)
    %i[by_any_texts]
  end
end
