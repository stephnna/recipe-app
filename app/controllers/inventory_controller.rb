class InventoryController < ApplicationController
  def index
    @inventory = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(
      name: inventory_params[:name]
      user_id: current_user.id
    )

    if @inventory.save
      redirect_to inventory_path
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    redirect_to inventory_path(current_user.id)

    if @inventory.destroy
      flash[:success] = 'Inventory deleted'
    else
      flash.now[:error] = 'Inventory Not Deleted'
    end
  end

  private 

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
