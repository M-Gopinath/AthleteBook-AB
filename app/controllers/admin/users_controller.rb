class Admin::UsersController < ApplicationController
  before_action :is_admin?
  
  def index
    @filter = params[:filter].present? ? params[:filter] : 'all'
    if params[:filter] == 'athlete'
      @users = User.where(role_id: Role.find_by_name('athelet'))
    elsif params[:filter] == 'team'
      @users = User.where(role_id: Role.find_by_name('team'))
    elsif params[:filter] == 'company'
      @users = User.where(role_id: Role.find_by_name('company'))
    else
      @users = User.all_users
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      redirect_to edit_admin_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :is_active)
  end
end
