class Recipe < ApplicationRecord
  has_many :recipes_foods, foreign_key: :recipe_id
  belongs_to :user, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :cooking_time, presence: true, length: { maximum: 20 }
  validates :preparation_time, presence: true, length: { maximum: 20 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
