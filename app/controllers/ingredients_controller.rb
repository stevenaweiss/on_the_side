class IngredientsController < ApplicationController

before_action :load_ingredient, only: [:show, :edit, :update, :destroy]

      def index
        @ingredients = Ingredient.all
        render(:index)
      end

      def show
        #call API here
        render(:show)
      end

      def new
        @ingredient = Ingredient.new
        render(:new)
      end

      def create
        Ingredient.create(ingredient_params)
        redirect_to ingredients_path
      end

      def edit

      end

      def update

      end

      def destroy

      end

  private

      def load_ingredient
        return @ingredient = Ingredient.find(params[:id])
      end

      def ingredient_params
        params.require(:ingredient).permit(:name, :photo_url)
      end


end
