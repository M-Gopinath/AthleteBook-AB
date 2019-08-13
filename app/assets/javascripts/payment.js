$(document).ready(function(){
	$(document).on("submit","#creditcard_form",function(e){
	   $(".gif-loader-img").css("display", "block");
		$.ajax({
			method: "POST",
			url: "/payments/payment_charge"	 ,
			data: $('#creditcard_form').serialize()
			// $('gif-loader-img').show(); 
		})
		.done(function(data) {
			if (data.success) {
				toastr.success(data.msg);
				window.location = ('/');

			} else {
				$.each(data.errors, function(k, v){
					toastr.error(k + " " + v);
				});
	           
	    }
	    $(".gif-loader-img").css("display", "none");

	   });

		e.preventDefault();	

	});
});