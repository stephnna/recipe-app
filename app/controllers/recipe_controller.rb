class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description))
    recipe.user = current_user
    if recipe.valid?
      recipe.save
      flash[:success] = "Recipe created successfully!"
      redirect_to recipe_index_path
    else 
      flash[:success] = "Did you leave a field empty? All fields must be filled before we can accept the review!"     
      redirect_to new_recipe_path
    end
  end
end
      