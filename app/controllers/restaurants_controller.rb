class RestaurantsController < ApplicationController

#before_action :load_user
#before_action :load_ingredient

def new
  @restaurant = Restaurant.new
end

def create
  #binding.pry
  @restaurant = Restaurant.new(restaurant_params)
  #@restaurant.ingredient = @ingredient
  @restaurant.user_id = @current_user
  @restaurant.save
  redirect_to user_path(@current_user)
end



private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :url, :user_id, :ingredient_id)
end

# def load_user
#   @user = Session.find(params[:user_id])
# end


#def load_ingredient
  #@ingredient = Ingredient.find(params[:id])
#end


end