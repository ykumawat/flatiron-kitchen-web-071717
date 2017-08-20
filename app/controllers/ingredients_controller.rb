class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ing_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def edit
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(ing_params)
    redirect_to ingredient_path(@ingredient)
  end

  private

  def ing_params
    params.require(:ingredient).permit(:name)
  end

end
