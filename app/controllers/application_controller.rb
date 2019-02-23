class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :current_user

  def logged_in?
	  !current_user.nil?
	end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
