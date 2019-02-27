class RestaurantsController < ApplicationController

  def index
    #@restaurant = Restaurant.find(session[:rest_id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    rests = YelpAdapter.search(restaurant_params[:cuisine],restaurant_params[:zip])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :rest_id, :zip)
  end
end
