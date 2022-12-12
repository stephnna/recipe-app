class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :inventories, foreign_key: :user_id
  has_many :recepies, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: 50 }
end
