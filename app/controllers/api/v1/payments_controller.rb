class PaymentsController < ApplicationController
	require "active_merchant/billing/model"
	def creditcard_validation
		cc = ActiveMerchant::Billing::CreditCard.new(
			:type               => params[:type],
			:number             => params[:number],
			:verification_value => params[:verification_value],
			:month              => params[:month],
			:year               => params[:year],
			:first_name         => params[:first_name],
			:last_name          => params[:last_name]
			)
		validation = cc.validate
		if validation.blank?
			render_success(msg: 'Credit Card Validation Success')
		else
			render_failed(errors: errors_full_msg(validation))
		end
	end

	def  payment_charge
		
		ActiveMerchant::Billing::Base.mode = :test
		gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
			:login => 'seller201@yopmail.com',
			:password => 'seller201@yopmail')
		cc = ActiveMerchant::Billing::CreditCard.new(
			:type               => params[:type],
			:number             => params[:number],
			:verification_value => params[:verification_value],
			:month              => params[:month],
			:year               => params[:year],
			:first_name         => params[:first_name],
			:last_name          => params[:last_name]

			)
		amount = params[:amount].to_i

		p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2222"
		p validation = cc.validate
		if validation.blank?
			p 'asddgsdg'
			# p response = gateway.authorize((amount * 100), cc, purchase_options)
			if response.success?
				p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2"
				p transaction = gateway.capture(amount *100,response.authorization)

				p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
				if p transaction.success?
					p "#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
					# cc = PaymentHistory.create(status:params[:status],user_id: params[:user_id])
					# cc.save

					render_success(msg:"The transaction has been successfully charged.")
				else
					render_failed(msg: 'The credit card you provided was declined.  Please double check your information and try again.')
				end
				#update_attribute({authorization_code: transaction.authorization, success: true})
			else
				render_failed(errors: response.message)
				# errors.add(:base, "The credit card you provided was declined.  Please double check your information and try again.")
			end	
		else
			render_failed(msg: errors_full_msg(validation))
		end
	end		
  # create_table "payment_histories", force: :cascade do |t|
  #   t.integer  "user_id",      limit: 4
  #   t.string   "payment_type", limit: 255
  #   t.string   "amount",       limit: 255
  #   t.string   "status",       limit: 255

  private

  def errors_full_msg(h)
  	h.collect {|k, v| k.to_s.humanize + ' ' +  v.first }
  end

  def purchase_options
  	{
  		:ip => request.remote_ip,
			# :billing_address => {
			# 	:name     => "Ryan Bates",
			# 	:address1 => "123 Main St.",
			# 	:city     => "New York",
			# 	:state    => "NY",
			# 	:country  => "US",
			# 	:zip      => "10001"
			# }
		}
	end
end


