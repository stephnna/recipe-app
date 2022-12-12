class Recipe < ApplicationRecord
  has_many :recipes_foods, foreign_key: :recipe_id
  belongs_to :user, foreign_key: :user_id
end
