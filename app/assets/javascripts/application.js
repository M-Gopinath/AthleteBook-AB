// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require bootstrap-sprockets
//= require bootstrap-editable
//= require bootstrapValidator
//= require bootstrap-editable-rails
//= require jquery.remotipart
//= require bootstrap
//= require_tree .

$(function() {
	$(".dropdown").hover(
		function(){ $(this).addClass('open') },
		function(){ $(this).removeClass('open') }
	);
});
$(document).ready(function() {
	$('#newRegistration')
	.bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			'user[role_id]': {
				message: 'The Role is not valid',
				validators: {
					notEmpty: {
						message: 'The Role is required and can\'t be empty'
					}
              }
            },
      'user[first_name]': {
				message: 'The First Name is not valid',
				validators: {
					notEmpty: {
						message: 'The First Name is required and can\'t be empty'
					}
              }
            },
       'user[last_name]': {
				message: 'The Last Name is not valid',
				validators: {
					notEmpty: {
						message: 'The Last Name is required and can\'t be empty'
					}
              }
            },
            'user[email]': {
            	validators: {
            		notEmpty: {
            			message: 'The Email address is required and can\'t be empty'
            		},
            		emailAddress: {
            			message: 'The input is not a valid email address'
            		}
            	}
            },
            'user[password]': {
            	validators: {
            		notEmpty: {
            			message: 'The Password is required and can\'t be empty'
            		}
            	}
            },
            'user[country_id]': {
            	validators: {
            		notEmpty: {
            			message: 'The Country is required and can\'t be empty'
            		}
            	}
            },
            'user[date_of_birth]': {
                validators: {
                	notEmpty: {
                		message: 'The date is required'
                	},
                	date: {
                		format: 'DD/MM/YYYY',
                		message: 'The date is not a valid'
                	}
                }
            },
            'user[company_name]': {
            	validators: {
            		notEmpty: {
            			message: 'The Company Name is required and cannot be empty'
            		}
            	}
            },
            'user[gender]': {
            	validators: {
            		notEmpty: {
            			message: 'The Gender is required and cannot be empty'
            		}
            	}
            },
            'user[company_logo]': {
            	validators: {
            		notEmpty: {
            			message: 'Please select an image'
            		},
            		file: {
            			extension: 'jpeg,jpg,png',
            			type: 'image/jpeg,image/png',
                  message: 'The selected file is not valid'
                }
              }
            }
          }
        })
	.on('success.form.bv', function(e) {
	    // Prevent form submission
	    e.preventDefault();

	    // Get the form instance
	    var $form = $(e.target);

	    // Get the BootstrapValidator instance
	    var bv = $form.data('bootstrapValidator');

	    // Use Ajax to submit form data
	    // $.post($form.attr('action'), $form.serialize(), function(res) {
	    // 	if(res.result){
	    // 		$(".notice").html(res.msg);
	    // 		$("#newRegistration").trigger("reset");
	    // 		clearImageName();
	    // 	}else {
	    // 		$(".notice").html(res.msg);
	    // 		$("#newRegistration").trigger("reset");
	    // 		clearImageName();
	    // 	}
	    // }, 'json');
	  });
});

$(document).ready(function() {
	$('#loginPage')
	.bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {		
            email: {
            	validators: {
            		notEmpty: {
            			message: 'The email is can\'t be empty'
            		},
            		emailAddress: {
            			message: 'The input is not a valid email address'
            		}
            	}
            },
            password: {
            	validators: {
            		notEmpty: {
            			message: 'The password is can\'t be empty'
            		}
            	}
            }
          }
        })
	.on('success.form.bv', function(e) {
	    // Prevent form submission
	    e.preventDefault();

	    // Get the form instance
	    var $form = $(e.target);

	    // Get the BootstrapValidator instance
	    var bv = $form.data('bootstrapValidator');

	    // Use Ajax to submit form data
	    $.post($form.attr('action'), $form.serialize(), function(res) {
	    	if(res.result){
	    		window.location.href = "/home/view";
	    	}else {
	    		$(".message").html(res.msg);
	    	}

	    }, 'json');
	  });
});

$( document ).ready(function() {
	fv.register("#loginPage");
	fv.register("#forgotPasswordForm");

	if ($(".login-type").val() == 1){
		$(".athelet-form").css("display","block");
		$(".team-form").css("display","none");
		$(".company-form").css("display","none");
		$(".athelet-form :input").attr('disabled', false);
		$(".team-form :input").attr('disabled', true);
		$(".company-form :input").attr('disabled', true);
	}

	$(".login-type").change(function(){
		console.log("login-type change");
		console.log($(".login-type").val());
		if ($(".login-type").val() == 1){
			$(".athelet-form").css("display","block");
			$(".team-form").css("display","none");
			$(".company-form").css("display","none");
			$(".athelet-form :input").attr('disabled', false);
			$(".team-form :input").attr('disabled', true);
			$(".company-form :input").attr('disabled', true);
		}else if($(".login-type").val() == 2){
			$(".team-form").css("display","block");
			$(".athelet-form").css("display","none");
			$(".company-form").css("display","none");
			$(".team-form :input").attr('disabled', false);
			$(".athelet-form :input").attr('disabled', true);
			$(".company-form :input").attr('disabled', true);
		}else if($(".login-type").val() == 3){
			$(".company-form").css("display","block");
			$(".team-form").css("display","none");
			$(".athelet-form").css("display","none");
			$(".company-form :input").attr('disabled', false);
			$(".team-form :input").attr('disabled', true);
			$(".athelet-form :input").attr('disabled', true);
		}
	});

//User login

	$(document).on("click", "#loginButton", function() {
		var email = $("#user_email").val();
		var password = $("#user_password").val();
		$.ajax({
			url: "/users/sessions/login",
			method: "POST",
			data: {email: email, password: password}
		}).done(function(res) {
			if(res.result){
				toastr.success(res.msg);
				window.location.href = '/home/view';
			}else{
				toastr.error(res.msg);
			}
		});
	});


	//User video upload
	
	$(document).on("submit", "#userVideoForm", function(e) {
		if ($("#uservideo_user_video").val() == ""){
			toastr.error('Kindly select a video file to upload.!');
     	e.preventDefault();
		}
	});

	//search for athlete, team, company

	$(document).on("submit", "#ransackSearchForm", function(e) {
		if ($("#searchField").val() == ""){
			toastr.error('Please enter something to search.!');
     	e.preventDefault();
		}
	});

	$(document).on("click", ".searchValue", function() {
		var role_id = $(this).data("roleid");
		var hidden_input = "<input type='hidden' value='"+role_id+"' name='q[role_id]'>";
		$(".user_search").append(hidden_input);
	});

	$(document).on("click", ".searchValue", function() {
		var newClass = $(this).find('i:first').attr('class');
		$("#search_concept").find("i:first").removeClass();
		$("#search_concept").find("i:first").addClass(newClass);
	});

	//File upload button
	
	$(document).on("change", "#user_role_id", function() {
		clearImageName();
	});

	$(document).on("change", "#user_company_logo", function() {
		$("#uploadFileName").text(($(this).prop("files")[0]['name']));
	});


});

function fillMeter(percent) {
	var pixels = (percent/100) * 90;
	$(".fill").css('top', (90-pixels) + "px");
	$(".level").css('top', (77-pixels) + "px");
	$(".fill").css('height', pixels + "px");


	if (percent <= 0) {
		$(".level").css("top", "67px");
		$(".fill").attr('data-before','Beginner');
	} else if (percent <= 25) {
		$(".fill").css('background', "#FF6D3E");
		$(".fill").attr('data-before','Beginner');
	} else if (percent <= 50) {
		$(".fill").css('background', "#F2C548");
		$(".fill").attr('data-before','Intermediate');
	} else if (percent <= 75) {
		$(".fill").css('background', "#2F9CE1");
		$(".fill").attr('data-before','Expert');
	} else if (percent <= 100) {
		$(".fill").css('background', "#287EB6");
		$(".fill").attr('data-before','All Star');
	} else if (percent <= 99) {
		$(".level").css("top", "0");
	}
	fillMeter(25);
}

function clearImageName() {
	$("#uploadFileName").text("");
}




