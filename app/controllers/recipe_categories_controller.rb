class RecipeCategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @show_categories = RecipeCategory.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
    end    
    before_action :authenticate_user!
    def destroy
        @recipes = Recipe.order("id asc")
    end
end