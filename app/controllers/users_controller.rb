class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :current_user, except: [:new, :create]

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    warnings = []
    user_params.each do |param|
      if param[1].empty?
        warnings << "#{param[0].split('_').join(' ')} is required"
      end
    end

    @user = User.new(user_params)
    if !warnings.empty?
      redirect_to new_user_path, alert: warnings
    elsif @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to new_user_path, alert: "Signup info invalid or incomplete."
    end
  end

  def show
    if valid_user?
      @user = User.find(params[:id])
    else
      redirect_to user_path(session[:user_id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :zip, :password, :password_confirmation)
  end

  def valid_user?
    params[:id] == session[:user_id].to_s
  end

end
