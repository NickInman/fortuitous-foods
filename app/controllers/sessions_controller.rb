class SessionsController < ApplicationController
  before_action :clear_data, except: [:destroy]

  def new
	  @user = User.new
	end

	def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.authenticate(session_params[:password])
	     session[:user_id] = @user.id
	     redirect_to user_path(@user)
    else
	     redirect_to login_path, alert: "Login info invalid or incomplete."
	  end
	end

	def create_fb
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth[:info][:name].split(' ').join('_')
      u.email = auth['info']['email']
      u.first_name = auth[:info][:name].split(' ').first
      u.last_name = auth[:info][:name].split(' ').last
      u.zip = 00000 #sets a default value
      u.password_digest = SecureRandom.base64  #generates a random hexadecimal for the password
    end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end

  def destroy
    session.destroy
    redirect_to root_path, alert: "Logged out!"
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

  def auth
   request.env['omniauth.auth']
  end

  def clear_data

  end

end
