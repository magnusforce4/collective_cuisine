class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes, each_serializer: RecipeSerializer
  end

  def search_by_ingredient
    @recipes = Recipe.search_by_ingredient(params[:ingredient_identifier])
    render json: @recipes, each_serializer: RecipeSerializer
  end
  
  def search_by_utensil
    @recipes = Recipe.search_by_utensil(params[:utensil_identifier])
    render json: @recipes, each_serializer: RecipeSerializer
  end
end
