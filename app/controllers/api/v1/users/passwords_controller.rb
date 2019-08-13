class Api::V1::Users::PasswordsController < Devise::PasswordsController

  skip_before_filter :verify_authenticity_token

  def new
       self.resource = resource_class.new
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      #render_success(msg: "successfully_sent")
      flash[:notice] = "sent password"
      # redirect_to :root
      # render_success(user: resource, success: true)
      render :status => 200,
           :json => { :success => true,
                      :info => "Check your mail", data: {user: resource} }
    else
      render :status => 200,
          :json => {
            :success => false,
            :info => "Please check your email.",
          }
      render "devise/sessions/new"
    end
  end

  def edit
   p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    render :status => 200,
           :json => { :success => true,
                      :info => "update your password", data: {user: resource} }
  end

# def update
#   @user = User.find(current_user.id)
#   if @user.update_attributes(params[:user])
#     set_flash_message :notice, :updated
#     # Sign in the user bypassing validation in case his password changed
#     sign_in @user, :bypass => true
#     redirect_to after_update_path_for(@user)
#   else
#     clean_up_passwords(resource)
#     respond_with_navigational(resource) do
#       if params[:change_password] # or flash[:change_password]
#         render :change_password
#       else
#         render :edit
#       end
#     end
#   end
# end

  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
















  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
# end
