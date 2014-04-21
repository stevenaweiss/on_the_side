module FoursquareHelper
  #initial foursq API call
  def get_foursq(ingredient, neighborhood)
    neighborhood_split = neighborhood.split(" ").join("+")
    ingredient_split = ingredient.split(" ").join("+")
    search_url = "https://api.foursquare.com/v2/venues/explore?client_id=#{FOURSQ_CLIENT_ID}&client_secret=#{FOURSQ_CLIENT_SECRET}&v=20130815&v=20130815&near=#{neighborhood_split}+new+york&query=#{ingredient_split}&limit=5"
    from_foursq = HTTParty.get(search_url)     
  end

  #parse through foursq data here
  def neighborhood
    foursquare_results = get_foursq(@ingredient.name, params[:neighborhood])
    @restaurant_lil_hash = foursquare_results["response"]["groups"][0]["items"].map do |restaurant|
      {
       :name => restaurant["venue"]["name"],
       :address => restaurant["venue"]["location"]["address"],
       :cross_st => restaurant["venue"]["location"]["crossStreet"],
       :url => restaurant["venue"]["url"],
       :lat => restaurant["venue"]["location"]["lat"], 
       :lng => restaurant["venue"]["location"]["lng"], 
       :image => single_picture(restaurant["venue"]["id"]),
       :static_map => google_map(restaurant["venue"]["location"]["lat"],restaurant["venue"]["location"]["lng"])
     }
    end
  end

  #returns photo from instagram
  def single_picture(foursq_id)
    foursq_hash = Instagram.location_search(foursq_id)
    if foursq_hash.empty?
      return "http://media.npr.org/assets/news/2010/01/30/tianshan2-1a2a29b83bc7a670bf8210d9c6daefa3ba46f971-s6-c30.jpg"
    else
    all_results = Instagram.location_recent_media(foursq_hash[0]["id"])
    if all_results.empty?
      return "http://media.npr.org/assets/news/2010/01/30/tianshan2-1a2a29b83bc7a670bf8210d9c6daefa3ba46f971-s6-c30.jpg"
    else
    all_results.sample["images"]["standard_resolution"]["url"]
    end
    end
  end

  def google_map(lat, lng)
    search_url = "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=13&size=400x300&markers=color:blue%7Clabel:X%7C#{lat},#{lng}&sensor=false&key=#{GOOGLE_STATIC_KEY}"
    return search_url
  end


end
