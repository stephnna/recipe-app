class RecipesFoodController < ApplicationController
  def index
    @recipes_food = RecipesFood.all
  end

  def show
    @recipes_food = RecipesFood.find(params[:id])
  end

  private

  def recipes_food_params
    params.require(:recipes_food).permit(:recipe_id, :food_id, :quantity)
  end
end
