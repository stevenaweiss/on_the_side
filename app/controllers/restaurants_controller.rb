class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to ingredients_path
  end



  private

  def restaurant_params
    params.permit(:name, :address, :url, :user_id, :ingredient_id)
  end


end