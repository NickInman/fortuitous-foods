class ApplicationController < ActionController::Base

  def destroy
    session.destroy
    redirect_to root_path
  end
  
end
