class Food < ApplicationRecord
  has_many :recipes_foods, foreign_key: :food_id
  has_many :inventory_foods, foreign_key: :food_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :measurement_unit, presence: true, length: { maximum: 20 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
