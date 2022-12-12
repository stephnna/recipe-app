class InventoryFood < ApplicationRecord
  belongs_to :inventory, foreign_key: :inventory_id
  has_many :foods, foreign_key: :food_id
end
