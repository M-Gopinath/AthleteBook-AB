class Admin::Basic::PlansController < ApplicationController
	def index
		@plans = Plan.all
	end

	def new
		@plan = Plan.new
	end

	def create
		Plan.create(plan_params)
		redirect_to admin_basic_plans_path
	end

	def edit
		@plan = Plan.find(params[:id])
	end

	def update
		@plan = Plan.find(params[:id])
		if @plan.update(plan_params)
			redirect_to admin_basic_plans_path
		else
			render 'edit'
		end

	end

	def destroy
		@plan = Plan.find(params[:id])
		@plan.destroy
		redirect_to admin_basic_plans_path
	end

	private

	def plan_params
		params.require(:plan).permit(:name, :description, :price)
	end

end
