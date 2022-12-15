class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public_recipe, :description))
    recipe.user_id = current_user.id
    if recipe.valid?
      recipe.save
      flash[:notice] = "Recipe created successfully"
      redirect_to user_recipe_index_path(id: current_user.id)
    else
      render :new
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    redirect_to user_recipe_index_path(current_user.id)
    if current_user == recipe.user
      recipe.destroy
    else
      flash[:danger] = "Sorry, something went wrong!"
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public_recipe)
  end
end
