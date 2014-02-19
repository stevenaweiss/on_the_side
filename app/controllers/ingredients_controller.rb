class IngredientsController < ApplicationController

  before_action :load_ingredient, only: [:show, :edit, :update, :destroy, :neighborhood]

  def index
    @ingredients = Ingredient.all
    render(:index)
  end

  def show

    render(:show)
  end

  def neighborhood
    #call api HERE
    @neighborhood = params[:neighborhood]
    data = get_foursq(@ingredient.name, @neighborhood)
    @restaurant_lil_hash = data["response"]["groups"][0]["items"].map do |restaurant|
      {
       :name => restaurant["venue"]["name"],
       :address => restaurant["venue"]["location"]["address"],
       :cross_st => restaurant["venue"]["location"]["crossStreet"],
       :url => restaurant["venue"]["url"],
       :lat => restaurant["venue"]["location"]["lat"].to_i,
       :lng => restaurant["venue"]["location"]["lng"].to_i,
       :image => single_picture(restaurant["venue"]["id"])
     }

    end

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

  def get_foursq(ingredient, neighborhood)
    neighborhood_split = neighborhood.split(" ").join("+")
    ingredient_split = ingredient.split(" ").join("+")
    search_url = "https://api.foursquare.com/v2/venues/explore?client_id=#{FOURSQ_CLIENT_ID}&client_secret=#{FOURSQ_CLIENT_SECRET}&v=20130815&v=20130815&near=#{neighborhood_split}+new+york&query=#{ingredient_split}&limit=5"
    from_foursq = HTTParty.get(search_url)     
    #binding.pry
  end

  def single_picture(foursq_id)
    #binding.pry
    foursq_hash = Instagram.location_search(foursq_id)
    #THIS IS WHERE SHIT OCCASIONALLY BREAKS
    location_id = foursq_hash[0]["id"]
    all_results = Instagram.location_recent_media(location_id)
    all_results.sample["images"]["standard_resolution"]["url"]
  end
    

end
