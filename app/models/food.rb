class Food < ApplicationRecord
  has_many :recipes_foods, foreign_key: :food_id
  has_many :inventory_foods, foreign_key: :food_id
end
