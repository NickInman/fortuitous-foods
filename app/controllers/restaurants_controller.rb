 class RestaurantsController < ApplicationController
  before_action :find_user, only: [:create, :new]
  before_action :fortuitous_button, only: [:new]

  def index
    @restaurants = Restaurant.all
    render :json => @restaurants

  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def search
    if params['randomize'] != '25'
      @rests = YelpAdapter.search(restaurant_params[:cuisine],restaurant_params[:zip], params['randomize']).sample
      flash.now[:notice] = "Here's a random restaurant from your area!"
    else
      @rests = YelpAdapter.search(restaurant_params[:cuisine],restaurant_params[:zip], params['randomize']).sample(5)
      flash.now[:notice] = 'Here are the first 5 results!'
    end
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
    if !!@user.favorites.find_by(restaurant_id: @restaurant.id)
      redirect_to users_path, notice: 'Restaurant already in favorites!'
    else
      @user.favorites.create(restaurant_id: @restaurant.id)
      redirect_to users_path, notice: 'Restaurant added to favorites!'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :review_count, :rating, :price, :city, :url, :image_url, :zip, :rest_id)
  end

  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  def fortuitous_button
    @cuisines = ['American', 'Asian Fusion', 'Bakeries', 'Barbecue', 'Brazilian', 'Breakfast & Brunch', 'Burgers', 'Cajun & Creole', 'Cantonese', 'Caribbean', 'Chicken Wings', 'Chinese', 'Cuban', 'Delis', 'Desserts', 'Diners', 'Donuts', 'Ethiopian', 'Falafel', 'French', 'Gluten-Free', 'Greek', 'Halal', 'Hawaiian', 'Hot Dogs', 'Indian', 'Italian', 'Japanese', 'Juice Bars & Smoothies', 'Korean', 'Kosher', 'Lebanese', 'Mediterranean', 'Mexican', 'Pakistani', 'Persian & Iranian', 'Peruvian', 'Pickup', 'Pizza', 'Ramen', 'Salads', 'Sandwiches', 'Seafood', 'Soup', 'Southern', 'Spanish', 'Steakhouses', 'Sushi', 'Szechuan', 'Tapas', 'Thai', 'Turkish', 'Vegan', 'Vegetarian', 'Vietnamese']
    @restaurant = Restaurant.new
  end
end
