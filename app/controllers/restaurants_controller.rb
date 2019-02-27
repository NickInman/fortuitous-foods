class RestaurantsController < ApplicationController

  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def search
    @rests = YelpAdapter.search(restaurant_params[:cuisine],restaurant_params[:zip])
    flash.now[:notice] = 'Here are the first 5 results.'
    render :index
  end

  def create
    @restaurant = Restaurant.find_or_create_by(rest_id: restaurant_params['rest_id']) do |r|
      r.name = restaurant_params['name']
      r.cuisine = restaurant_params['cuisine']
      r.review_count = restaurant_params['review_count']
      r.rating = restaurant_params['rating']
      r.price = restaurant_params['price']
      r.city = restaurant_params['city']
      r.url = restaurant_params['url']
      r.image_url = restaurant_params['image_url']
      r.zip = restaurant_params['zip']
    end
      binding.pry
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :review_count, :rating, :price, :city, :url, :image_url, :zip, :rest_id)
  end
end
