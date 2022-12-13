class InventoryFoodController < ApplicationController
  def index
    @inventory_food = InventoryFood.all
  end
end
