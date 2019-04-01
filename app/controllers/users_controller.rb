class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :current_user, except: [:new, :create]
  before_action :find_user, only: [:index, :edit, :update, :destroy]

  def index
    @favs = @user.favorites.map do |f|
      Restaurant.find_by(id: f.restaurant_id)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to new_user_path, alert: @user.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      binding.pry
      redirect_to users_path, alert: "Update failed"
    end
  end

  def show
    if valid_user?
      @user = User.find(params[:id])
    else
      redirect_to user_path(session[:user_id])
    end
  end

  def destroy
    @user.destroy
    session.delete(:user_id)
    redirect_to root_path, alert: "Account deleted"
  end

  private
  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :zip, :password, :password_confirmation)
  end

  def valid_user?
    params[:id] == session[:user_id].to_s
  end

end
