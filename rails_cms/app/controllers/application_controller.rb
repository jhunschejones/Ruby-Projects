class ApplicationController < ActionController::Base
  
  private

  def authenticate_user
    if !session[:user_id]
      flash[:notice] = "Please log in."
      # redirect prevents requested action from running
      redirect_to(access_login_path)
    end
  end
end
