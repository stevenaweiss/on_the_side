class RestaurantsController < ApplicationController

  before_action :load_restaurant, only: [:destroy]
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if current_user.restaurants.map(&:url).include? @restaurant.url
      flash[:error] = "You already saved this restaurant!"
      redirect_to user_path(current_user)
    else
      @restaurant.save
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to user_path(current_user)
  end

  # def in_db?
  #   @restaurants = Restaurant.all
  #   @restaurants.include(@restaurant.url)
  # end


  private

  def restaurant_params
    params.permit(:name, :address, :url, :user_id, :ingredient_id)
  end

  def load_restaurant
    return @restaurant = Restaurant.find(params[:id])
  end


end