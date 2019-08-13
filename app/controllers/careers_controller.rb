class CareersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :authenticate_user!

  def add_career
  	@add_career = Career.new
  end

  def add_career_create
    @add_career = current_user.careers.build(career_params)
    @add_career.save
  end

  def career_edit
    @career = current_user.careers.find_by(id: params[:career_id])
    render partial: "careers/career_edit"
  end

  def career_update
    @career = current_user.careers.find_by(id: params[:career_id]) 
    @career.update(career_params)
  end

  def career_destroy
	  @career = current_user.careers.find_by(id: params[:career_id]) 
	  @career.destroy
	  redirect_to home_edit_profile_path
  end
 
  private
  
  def career_params
    params.require(:career).permit(:id, :year, :description, :carrer_name, :career_file, :user_id)
  end

end
