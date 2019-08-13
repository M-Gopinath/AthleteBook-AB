class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def confirm_registration
    confirmation_token = params.require(:confirmation_token)
    user = User.find_by_confirmation_token(confirmation_token)
    if user.present?
      if user.confirmed_at.present?
        render :json => { :success => false,
                          :info => "Your account has been already activated. Please sign in." }
      else
        user.confirmed_at = DateTime.now
        user.is_active = true
        if user.save
          resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
          sign_in(resource_name, resource)
          token = current_user.generate_auth_token
          render status: 200, json: {
            success: true,
            info: 'Your account has been confirmed',
            data: { 
              auth_token: token,
              user_role: current_user.role.name,
              user_id: current_user.id
            }
          }
        else
          render :json => { :success => false,
                          :info => user.errors,
                          :status => 422 }
        end
      end
    else
      render :json => {:error => 'Incorrect confirmation parameters'}, :status => 401
    end
  end
end