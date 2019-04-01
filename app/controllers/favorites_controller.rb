class FavoritesController < ApplicationController
    before_action :find_user, only: [:index, :search, :edit, :update, :destroy]

  def index
    @favs = @user.favorites.map do |f|
      Restaurant.find_by(id: f.restaurant_id)
    end
  end

  def search
    @favs = @user.restaurants.select do |f|
      f.name.downcase.include?(params['search'].downcase)
    end
    render :index
  end

  def show
  end

  def update
    @fav = Favorite.find_by(id: params['id'])
    @fav.fav_dish = params['fav_dish']
    @fav.save
    redirect_to user_favorites_path(params['user_id'])
  end

  def destroy
    @user.favorites.each do |f|
      if @user.id == f.user_id && params['id'] == f.restaurant_id.to_s
        f.destroy
        rest_name = Restaurant.find_by(id: f.restaurant_id).name
        if Favorite.all.map{|fav|fav.restaurant_id}.to_s.exclude?(params['id'])
          Restaurant.find_by(id: params['id']).destroy
        end
        redirect_to users_path, notice: "Deleted #{rest_name} from your favorites."
      end
    end
  end

  private

  def find_user
    @user = User.find_by(id: session[:user_id])
  end

end
