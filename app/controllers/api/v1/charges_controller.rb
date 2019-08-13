class ChargesController < ApplicationController
  include JsonRenderHelper

  def creditcard_payment
    require 'payments'
    amount = params[:amount] * 100
    payments_obj = Payments.new
    token = payments_obj.token_generate(params[:number], params[:exp_month], params[:exp_year], params[:cvc])
    if @user.stripe_account_id.blank?
      stripe_account_id = payments_obj.create_customer(@user, token)
      @user.update(stripe_account_id: stripe_account_id)
    end
    if payments_obj.charge(@user, amount, token)
      render_success msg: 'success'
      @user.payment_histories.create(user_id: @user.id, payment_type: "creditcard", amount: amount, status: "success")
    else 
      payments_obj.error_message
      render_failed msg: 'false'
      @user.payment_histories.create(user_id: @user.id, payment_type: "creditcard", amount: amount, status: "failed")
    end
  end

  def paypal_payment
    charge = params[:charge]
    amount = (charge[:amt].to_f * 100.to_f).to_i
    if params[:st] == 'Completed'
      render_success msg: 'success'
      @user.payment_histories.create(user_id: @user.id, payment_type: "paypal", amount: amount, status: "success")
    else
      render_failed msg: 'false'
      @user.payment_histories.create(user_id: @user.id, payment_type: "paypal", amount: amount, status: "failed")
    end
  end
end #class end
