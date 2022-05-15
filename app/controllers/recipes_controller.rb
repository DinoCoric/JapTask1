class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @recipe_category = RecipeCategory.find(params[:recipe_category_id])
    if params[:search].blank?
      @show_recipes = RecipeIngredient.select("recipes.id, recipes.name, sum(ingredients.unit_price)").joins(:ingredient , :recipe).where('recipes.recipe_category_id = ?', params[:recipe_category_id]).group("recipes.id").limit(10).order("sum asc")
    else
      @parameter = params[:search].downcase
      @show_recipes = RecipeIngredient.select("recipes.id, recipes.name, sum(ingredients.unit_price)").joins(:ingredient , :recipe).where("(lower(recipes.name) LIKE ? OR lower(ingredients.name) LIKE ?) AND recipes.recipe_category_id = ? ", "%" + params[:search].downcase + "%", "%" + params[:search].downcase + "%", params[:recipe_category_id]).group("recipes.id").limit(10).order("sum asc")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @show_ingredients = RecipeIngredient.select("ingredients.name, ingredients.unit_price, ingredients.unit_quantity, ingredients.measurement_unit").joins(:ingredient).where("recipe_ingredients.recipe_id = ?", params[:id])
    @recipe_cost = @show_ingredients.sum("ingredients.unit_price")
  end
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.select("id, concat(name, ' ' , unit_price, '$ ', unit_quantity, measurement_unit) as name")
  end
  def create
    @new_recipe = Recipe.new(recipe_category_id: params[:recipe_category_id], name: params[:recipe][:name],
                         description: params[:recipe][:description])

    if @new_recipe.save
        params[:recipe][:recipe_ingredients].each do |ingredient|
          RecipeIngredient.create(recipe_id: @new_recipe.id, ingredient_id: ingredient.to_i)
        end
      redirect_to recipes_index_path
    else
      redirect_to recipes_index_path
    end
  end
end
