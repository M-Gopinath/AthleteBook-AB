// Stores the Current Payment Form Id
var paymentForm;
var stripeHandler;

$(function(){
	$(document).on("click", "#customStripePayment", function() {
		var amount = $(this).data("price");
		var title = $(this).data("name");
		var description = $(this).data("description");
		pay(amount, title, "for plan", $("#stripeForm"), description);
	});
});

// Handler for Stripe Checkout
function connectStripe() {
	try {
		stripeHandler = StripeCheckout.configure({
			key: $(".stripe_public_key").val(),
			locale: 'auto',
			token: function(token) {
				var token_input = "<input class='stripe_token' type='hidden' name='stripeToken' value='" + token.id + "'>";
				$(paymentForm).append(token_input);
				$.ajax({
					url: "/payments/stripe_payment",
					method: "POST",
					data: $(paymentForm).serialize()
				}).done(function(res) {
					if(res.result){
					toastr.success(res.msg);
					window.location.href = '/';
					}else{
						toastr.error(res.msg);
						window.location.href = '/';
					}
				});
			}
		});
		return true;
	} catch (e) {
		toastr.error("Cannot Connect to Payment, please try reloading page.");
		return false;
	}
}

// Invokes handler and sends data to show the payment popup
function pay(amount, title, pay_text, frm, desc) {
	if(connectStripe()){
		paymentForm = frm;
		$(".payment_btn").text(pay_text);
		stripeHandler.open({
			name: title,
			description: desc,
			amount: amount,
		});      
	}
	else{
    toastr.error("Stripe connection error.");
    }
  }
