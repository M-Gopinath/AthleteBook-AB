class ApplicationController < ActionController::Base
  before_filter :set_search
  before_action :user_payment_plans
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  respond_to :html, :json

  def resource_name
    :user
  end

  def is_admin?
    if !current_admin_user
      redirect_to new_admin_user_session_path
    elsif current_admin_user.present? && current_admin_user.admin?
      return true
    else
      redirect_to root_path
    end
  end

  def toast(type, text)
    flash[:toastr] = { type => text }
  end 
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #include helper
  include ApplicationHelper
  #helper_method :resource_name, :resource, :devise_mapping
   
  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :email, :password) }
  end

  def after_sign_in_path_for(resource_or_scope)
    home_view_path
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :first_name, :last_name, :role_id, :account_type_id, :gender, :date_of_birth, :country_id, :plan_id) }
  #   devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password) }
  # end

  def set_search
    @q=User.search(params[:q])
  end

  def user_payment_plans
    @plans = Plan.all
  end

end
