class RestaurantsController < ApplicationController

  #before_action :load_user
  #before_action :load_ingredient

  def new
    @restaurant = Restaurant.new
  end

  def create
    #binding.pry
    #@restaurant = Restaurant.new(restaurant_params)
    @restaurant = Restaurant.create(restaurant_params)
    #@restaurant.ingredient = @ingredient
    #@restaurant.user_id = @current_user
    #@restaurant.save
    #redirect_to user_path(@current_user)
    redirect_to ingredients_path
  end



  private

  def restaurant_params
    params.permit(:name, :address, :url, :user_id, :ingredient_id)
  end


end