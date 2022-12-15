class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :inventories, foreign_key: :user_id
  has_many :recepies, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: 50 }

  ROLES = %i[admin default guest].freeze
end
