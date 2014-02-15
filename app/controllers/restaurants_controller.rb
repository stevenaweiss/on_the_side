class RestaurantsController < ApplicationController


def new
  @restaurant = Restaurant.new
  #render(:new)
end

def create
  @restaurant = Restaurant.new(restaurant_params)
  @restaurant.ingredient = @ingredient
  #@restaurant.
end



private

def restaurant_params

end


end