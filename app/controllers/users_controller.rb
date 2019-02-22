class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :zip, :password)
  end
end
