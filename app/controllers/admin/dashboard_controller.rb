class Admin::DashboardController < ApplicationController
  before_action :is_admin?
  
  def index
  	@user = User.all_users
  end
end
