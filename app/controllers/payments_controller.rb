class PaymentsController < ApplicationController
	include JsonRenderHelper
	require "active_merchant/billing/model"
	def upgrade_plans
		@plans = Plan.all
	end

	def payment_option_page
		@plan = Plan.find(params[:id])
	end

	def stripe_payment
		require 'payments'
		amount = params[:price]
		payments_obj = Payments.new
		if current_user.stripe_account_id.blank?
			stripe_account_id = payments_obj.create_customer(current_user, params[:stripeToken])
			current_user.update(stripe_account_id: stripe_account_id)
		end
		if payments_obj.charge(current_user, amount, params[:stripeToken])
			current_user.payment_histories.create(payment_type: "stripe", amount: amount, status: "success")
			exp_date = current_user.payment_plan( params[:plan_id])
			if current_user.user_plan.present?
				current_user.user_plan.update(expiry_date: exp_date)
			else
				@user_payment = current_user.create_user_plan(plan_id: params[:plan_id], amount: amount, payment_type: "Stripe", status: "Active", expiry_date: exp_date )
			end
			render_success msg: "Payment success.! Now, you are a premium member"
		else 
			payments_obj.error_message
			current_user.payment_histories.create(payment_type: "stripe", amount: amount, status: "failed")
		  render_failed msg: 'Payment false. Cannot create your plan'
		end
	end

	def  payment_charge
		cc = ActiveMerchant::Billing::CreditCard.new(
			:type               => params[:type],
			:number             => params[:number],
			:verification_value => params[:verification_value],
			:month              => params[:month],
			:year               => params[:year],
			:first_name			=> current_user.first_name ? current_user.first_name : "",
			:last_name			=> current_user.last_name ? current_user.last_name : ""
			)
		amount = params[:price].to_i
		validation = cc.validate
		if validation.blank?
			response = GATEWAY.authorize(amount * 100, cc,purchase_options)
			if response.success?
				transaction = GATEWAY.capture(amount *100,response.authorization)
				if transaction.success?
					exp_date = current_user.payment_plan( params[:plan_id])
					if current_user.user_plan.present?
						current_user.user_plan.update(expiry_date: exp_date)
					else
						@user_payment = current_user.create_user_plan(plan_id: params[:plan_id], amount: amount, payment_type: "CreditCard", status: "Active", expiry_date: exp_date )
					end
					render :json => { :success => true , :msg => "The transaction has been successfully charged. Now you are a premium member" }
				else
					render :json => {:success => true, :errors => validation}
				end
			else
				render :json => {:success => false, :errors => validation}
			end
		else
			render :json => {:success => false, :errors => validation}
		end
	end		
	private

	def errors_full_msg(h)
		h.collect {|k, v| k.to_s.humanize + ' ' +  v.first }
	end

	def purchase_options
		{
			:ip => request.remote_ip,
		}
	end
end
