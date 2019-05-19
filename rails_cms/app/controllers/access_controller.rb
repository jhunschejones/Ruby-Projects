class AccessController < ApplicationController

  layout 'admin'
  before_action :authenticate_user, except: [:login, :attempt_login, :logout]

  def menu
    @username = session[:username]
  end

  def login
    # show login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      # where returns an array and santizies search parameters
      @user = AdminUser.where(username: params[:username]).first
    end

    if @user && @user.authenticate(params[:password])
      # mark user as logged in using session
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to(admin_path)
    else
      # instead of waiting for the next request, `now` uses it for this request
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to(access_login_path)
  end
end
