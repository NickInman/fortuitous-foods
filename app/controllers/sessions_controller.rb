class SessionsController < ApplicationController

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

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

end
