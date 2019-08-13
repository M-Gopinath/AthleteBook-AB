class Users::SessionsController < Devise::SessionsController
  include JsonRenderHelper
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_filter :verify_authenticity_token
  skip_filter :verify_signed_out_user, only: :destroy
  before_filter :configure_permitted_parameters
  # skip_before_filter :verify_authenticity_token,
                     # if: proc { |c| p 'c.request.format'; p c.request.format; c.request.format == 'application/json' }
  respond_to :json

  def login
    user = User.find_by(email: params[:email])
   # if user
      if user && user.valid_password?(params[:password])
        sign_in(user)
       render_success msg: 'Login successfully.'
      else
        render_failed msg: 'Invalid email or password.'
      end
    # else
    #   render_failed msg: 'Cannot find you. So, kindly create your account.'  
    # end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    #set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    yield if block_given?
    #render json: { success: true, data: 'sign out success' }
    redirect_to root_path
  end

  def failure
    redirect_to root_path
    # render status: 401,
    #        json: { success: false,
    #                info: 'Login Failed',
    #                data: {} }
  end

  def new
    redirect_to root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :email, :password) }
  end
end
