class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :image, presence: true
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :age, presence: true, length: { maximum: 10 }
  validates :introduction, length: { maximum: 100 }
  validates :email, presence: true

  belongs_to :residence, optional: true
  belongs_to :gender, optional: true
  has_many :comments
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image
end
