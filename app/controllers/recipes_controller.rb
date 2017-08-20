class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(rec_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(rec_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def rec_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
