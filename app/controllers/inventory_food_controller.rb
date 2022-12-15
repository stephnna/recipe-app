class InventoryFoodController < ApplicationController
  def index
    @inventory_food = InventoryFood.all
  end

  def show
    @inventory_food = InventoryFood.find(params[:id])
  end

  def new
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = InventoryFood.new(
      quantity: inventory_food_params[:quantity],
      food_id: inventory_food_params[:food_id],
      inventory_id: inventory_food_params[:inventory_id],
    )

    if @inventory_food.save
      redirect_to user_inventory_index_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @inventory_food = InventoryFood.find_by(id: params[:id])

    redirect_to user_inventory_index_path(current_user.id)

    if @inventory_food.destroy
      flash[:success] = 'Inventory deleted'
    else
      flash.now[:error] = 'Inventory Not Deleted'
    end
  end

  # def shopping
  #   @inventory = Inventory.all
  # end

  private

  def inventory_food_params
    params.permit(:quantity, :food_id, :inventory_id)
  end
end
