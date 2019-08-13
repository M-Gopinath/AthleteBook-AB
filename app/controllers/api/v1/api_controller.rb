# Base class for api v1
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  include JsonRenderHelper
  skip_before_action :verify_authenticity_token
  before_action :auth_request
  before_action :auth_user

  def resource_name
    :user
  end

  private

  def auth_request
    api_token = Rails.application.secrets.backend_api_v1
    token = request.headers['Api-Token']
    unless token.present? && token == api_token
      render_failed(msg: 'Invalid API Token.')
    end
  end

  def auth_user
    token = request.headers['Auth-Token']
    if token.present? && User.verify_token(token)
      @user = User.token_user(token)
    else
      render_failed(msg: 'Invalid Auth Token or Expired.')
    end
  end
end