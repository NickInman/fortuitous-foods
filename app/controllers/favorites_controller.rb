class FavoritesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @favs = @user.favorites.map do |f|
      Restaurant.find_by(id: f.restaurant_id)
    end
  end

  def show
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
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

end
