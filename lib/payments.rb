# Stripe Payment Gateway api
class Payments
  attr_reader :error_message, :charge_obj

  def create_customer(user, token)
    customer = Stripe::Customer.create(
      description: "Customer for #{user.email}",
      source: token
    )
    customer.id
  rescue => e
    @error_message = e.message
    false
  end

  def charge(user, amount, token, currency = 'usd')
    @charge_obj = Stripe::Charge.create(amount: amount,
                                        currency: currency,
                                        source: token,
                                        description: "Charge for #{user.email}")
    @charge_obj.paid
  rescue => e
    @error_message = e.message
    false
  end

end
