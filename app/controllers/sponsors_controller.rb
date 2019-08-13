class SponsorsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	before_filter :authenticate_user!

	def sponsor_new
    @sponsor = Sponsor.new
	end

	def sponsor_create
		@old_sponsor = current_user.sponsors.find_by(company_id: params[:company_id])
		if @old_sponsor.present?
		  @sponsor = nil
		else
			@sponsor = Sponsor.new(user_id: current_user.id,company_id: params[:company_id])
			@sponsor.save
		end
	end

	def sponsor_edit
		@sponsor = current_user.sponsors.find_by(id: params[:sponsor_id])
		render partial: "sponsors/sponsor_edit" , layout:false

	end

	def sponsor_update
		@sponsors = current_user.sponsors.find_by(company_id: params[:company_id])
		if @sponsors.present?
			@sponsor_update = nil
		else
			@sponsor_update = current_user.sponsors.find(params[:sponsor_id]) 
			@sponsor_update.update(company_id: params[:company_id])
		end
	end

	def sponsor_destroy
		@sponsor = Sponsor.find_by(params[:sponsor_id])
		@sponsor.destroy
		redirect_to home_edit_profile_path
	end	

	private

	def sponser_params
		params.require(:sponser).permit(:id,:user_id,:company_id)

	end

end
