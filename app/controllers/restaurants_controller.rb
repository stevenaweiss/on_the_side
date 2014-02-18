class RestaurantsController < ApplicationController

  before_action :load_restaurant, only: [:destroy]
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @restaurant.destroy
    redirect_to user_path(current_user)
  end



  private

  def restaurant_params
    params.permit(:name, :address, :url, :user_id, :ingredient_id)
  end

  def load_restaurant
    return @restaurant = Restaurant.find(params[:id])
  end


end