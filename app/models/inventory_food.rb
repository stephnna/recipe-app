class InventoryFood < ApplicationRecord
  belongs_to :inventory, foreign_key: :inventory_id, dependent: :destroy
  belongs_to :food, foreign_key: :food_id, dependent: :destroy

  validates :quantity, presence: true, length: { maximum: 50 }
end
