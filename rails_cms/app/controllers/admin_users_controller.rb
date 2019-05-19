class AdminUsersController < ApplicationController

  layout 'admin'
  before_action :authenticate_user

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    admin_user = AdminUser.new(admin_user_params)

    if admin_user.save
      redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    admin_user = AdminUser.find(params[:id])

    if admin_user.update_attributes(admin_user_params)
      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    admin_user = AdminUser.find(params[:id])
    admin_user.destroy
    redirect_to(admin_users_path)
  end

  private

  def admin_user_params
    # whitelist params for mass-assignment
    params.require(:admin_user).permit(:username, :email, :first_name, :last_name, :password)
  end
end
