class HomesController < ApplicationController

  def get_countries
    @countries = Country.all
    render :status => 200,
           :json => { :success => true,
                      :countries => @countries }
  end

  def get_roles
  	@roles = Role.where.not(name: 'admin')
  	render :status => 200,
           :json => { :success => true,
                      :roles => @roles }
  end
end