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
    @food = @ingredient.name
    data = get_foursq(@food, @neighborhood)
    @restaurant_lil_hash = data["response"]["groups"][0]["items"].map do |restaurant|  
      {
       :name => restaurant["venue"]["name"],
       :address => restaurant["venue"]["location"]["address"],
       :cross_st => restaurant["venue"]["location"]["crossStreet"],
       :url => restaurant["venue"]["url"]
     }
      end
    #binding.pry
  end

  # def gram
  #    @gram = Instagram.media_search("40.682499","-73.993131")
  # end

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
      params.require(:ingredient).permit(:name, :photo_url)
    end

    def get_foursq(ingredient, neighborhood)
      neighborhood_split = neighborhood.split(" ").join("+")
      ingredient_split = ingredient.split(" ").join("+")
      search_url = "https://api.foursquare.com/v2/venues/explore?client_id=#{FOURSQ_CLIENT_ID}&client_secret=#{FOURSQ_CLIENT_SECRET}&v=20130815&v=20130815&near=#{neighborhood_split}+brooklyn&query=#{ingredient_split}&limit=5"
      from_foursq = HTTParty.get(search_url)     
      #binding.pry
    end

  end
