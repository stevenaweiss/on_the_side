class IngredientsController < ApplicationController
  include FoursquareHelper

  before_action :load_ingredient, only: [:show, :edit, :update, :destroy, :neighborhood]

  def index
    @ingredients = Ingredient.all
    if current_user.nil?
      redirect_to login_path
    else
    render(:index)
    end
  end

  def show
    if current_user.nil?
      redirect_to login_path
    else
    render(:show)
    end
  end

  def new
    if admin?
      @ingredient = Ingredient.new
      render(:new)
    else
      redirect_to ingredients_path
    end
  end

  def create
    Ingredient.create(ingredient_params)
    redirect_to ingredients_path
  end

  def edit
    unless admin?
      redirect_to ingredients_path
    end
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredients_path
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def load_ingredient
    return @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :photo_url, :description)
  end

end
