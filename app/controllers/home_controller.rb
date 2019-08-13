class HomeController < ApplicationController
  include JsonRenderHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!, except: [:index, :create]
  def index
    #redirect_to admin_path if current_admin_user.present?
    redirect_to home_view_path if current_user
    @q = User.ransack(params[:q])
    @search = @q.result(distinct: true)

  end

  # social power
  def facebook_details
    access_token = env["omniauth.auth"]['credentials']['token']
    @graph = Koala::Facebook::API.new(access_token)
    @profile = @graph.get_object("me")
    @likes = @graph.get_connections("me", "likes").count
    @friends = @graph.get_connections("me", "friends").count
    @invitable_friends = @graph.get_connections("me", "invitable_friends").count
    @permission_check = @graph.get_connections('me','permissions')
    p @graph
    p 'user_details'
    p @profile
    p 'friends'
    p @friends
    p 'invitable_friends'
    p @invitable_friends
    p 'likes'
    p @likes  
    redirect_to home_edit_profile_path
  end

  def instagram_details
    access_token = env["omniauth.auth"]['credentials']['token']
    p 'access_token_instagram'
    p access_token
    session[:access_token] = access_token
    Instagram.configure do |config|
      config.client_id = "49873a0d67bd43b48b137e4fff7e15ef"
      config.client_secret = "284792c411774d9f8a52042cc1804e27"
    end
    client = Instagram.client(:access_token => session[:access_token])
    user = client.user
    username = user.username
    full_name = user.full_name
    counts = user.counts
    followed_by = counts.followed_by
    follows = counts.follows
    p 'user details'
    p user = client.user
    p 'username'
    p username
    p 'follows'
    p follows
    p 'followed_by'
    p followed_by
    redirect_to home_edit_profile_path
  end

  def pinterest_details
    p 'pinterest_details'
    redirect_to home_edit_profile_path
  end

  def google_details
    p 'google_details'
    redirect_to home_edit_profile_path
  end
  # social power end


  def athletes_list
    if params[:q]
      role_icons = {"0"=> "fa fa-search", "1"=> "fa fa-user", "2"=> "fa fa-users", "3"=> "fa fa-building-o"}
      @role_id = role_icons[params[:q][:role_id]]
      if params[:q][:role_id].to_i != 0
        @search_string = params[:q][:first_name_or_last_name_or_email_cont] 
        @q = User.ransack(first_name_or_last_name_or_email_cont: @search_string, role_id_eq: params[:q][:role_id])
        @search = @q.result(distinct: true)
        
      else
        @search_string = params[:q][:first_name_or_last_name_or_email_cont] 
        @q = User.ransack(first_name_or_last_name_or_email_cont: @search_string)
        @search = @q.result(distinct: true)
      end
    else
      redirect_to root_path
    end
  end

  def athlete_campare
    session[:athlete_id] = [] unless session[:athlete_id]
    if session[:athlete_id].length < 4 
      session[:athlete_id] << params[:user]
    else
      flash[:error] = 'You have already selected 4 Athletes'
    end
    redirect_to home_athletes_list_path
  end

  def athlete_campare_page
    @athlete = []
    if session[:athlete_id] == nil
      @message = "not found"
    else
      session[:athlete_id].each do |user_id|
        user_id
        @user = User.find_by_id(user_id)
        @athlete << @user.user_profile
      end
      session[:athlete_id] = nil
    end
    
  end

  def individual_athlete
    @user = User.find_by_id(params[:id])
    @athlete = @user.user_profile
  end

  def view
    @plans = Plan.all
    @career_all =  current_user.careers
    @uservideos = current_user.user_videos.all
    @sponsors = current_user.sponsors
  end

  def profile_field_update
    @edit_profile = current_user.user_profile   
    @edit_profile.update(cover_image: params[:cover_image], public_image: params[:public_image], description: params[:description])
      redirect_to home_edit_profile_path
  end   

  def edit_profile
    @uservideos = current_user.user_videos.all
    @educations_all = current_user.educations
    @career_all = current_user.careers
    @experiences_all = current_user.experiences
    @skill_all  = Skill.all
    @athlete_skills = current_user.skills
    @user = User.all
    @sponsors = current_user.sponsors
  end

  def create
    @user = User.create(user_params)
  end

  def destroy
    skill = Skill.where(id: params[:id].to_i).first
    @athlete_skills = current_user.skills.where(id: skill.id).first
    if skill.present? && @athlete_skills.present?
      @athlete_skills.delete
      redirect_to home_edit_profile_path
    else
      redirect_to home_edit_profile_path
    end
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def resource_class
    devise_mapping.to
  end

  def active_for_authentication?
    true
  end

  def set_flash_message!(key, kind, options = {})
    if is_flashing_format?
      set_flash_message(key, kind, options)
    end
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :role_id, :account_type_id, :gender, :date_of_birth, :country_id, :team_name, :plan_id, :company_name, :company_logo)
  end

  def education_params
    params.require(:education).permit(:id, :period, :course_of_study, :activities, :descripition, :user_id, :institution_id, :education_type_id)
  end
  
end
