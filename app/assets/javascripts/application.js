// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require social-share-button
//= require twitter/typeahead                                                                                                                                                                                                                             
//= require_tree .

$(document).ready(function() {
	
	
	window.setTimeout(function() {
	    $(".top-alert").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 3000);
	
	
	
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  e.target // activated tab
		  e.relatedTarget // previous tab
		});

	  $('.typeahead').typeahead( {name: 'planets', remote: '/pages/phones.json?search=%QUERY', limit: 10
	// [ "Fuck", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune" ] 
	});



$("#up").click(function() {
 
	$('#up').attr('disabled','disabled'); 
	$("#down").removeAttr('disabled');
	
});

	$("#down").click(function() {
		
			
		$("#up").removeAttr('disabled');
		$('#down').attr('disabled','disabled'); 
		
			
	});
	
	
	$(function() {

	    // Setup form validation on the #registerform element
	    $("#new_account").validate({
	        // Specify the validation rules
	        rules: {
	            "account[subdomain]": {
		required: true,
	rangelength: [6,40],
	},
	           "account[owner_attributes][email]": {
	                required: true,
	                email: true,
	
	            },
	            "account[owner_attributes][password]": {
	                required: true,
	            },
	            "account[owner_attributes][password_confirmation]": {
	                required: true,
	            }
	        },
	        // Specify the validation error messages
	        messages: {
	            "account[subdomain]": {
		required: "Please enter your display name",
		rangelength: "Enter a display name between 6 to 40 chararcters",
		
	},
	           "account[owner_attributes][password]": {
	                required: "Please provide a password",
	            },
	            "account[owner_attributes][password_confirmation]": {
	                required: "Please confirm the password",
	            },
	            "account[owner_attributes][email]": {
	required:	"Please enter a valid email address",
	email: "Please type in a valid email address"
	} 
	        },


	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
	  });
	
	
	
	
	$(function() {

	    // Setup form validation on the #registerform element
	    $("#new_vendor").validate({

	        // Specify the validation rules
	        rules: {
	            
	            "vendor[email]": {
	                required: true,
	                email: true
	            },
	           "vendor[password]": {
	                required: true,
	            },
	            
	        },
	        // Specify the validation error messages
	        messages: {
	           
	            "vendor[password]": {
	                required: "Please provide a password",
	            },
	          
	            "vendor[email]": "Please enter a valid email address",
	        },

	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
	  });
	
	
	
	
	$(function() {

	    // Setup form validation on the #registerform element
	    $("#new_listing").validate({
	        // Specify the validation rules
	        rules: {
	            "listing[headline]": {
		required: true,
	rangelength: [6,60],
	},
	
	"listing[description]": {
required: true,
rangelength: [6,140],
},

"listing[devicecondition]": {
required: true,
},
"listing[askprice]": {
required: true,
digits: true,
rangelength: [1,6],
},
"listing[accessories]": {
required: true,
},

"listing[deivcecolor]": {
required: true,
},
"listing[devicestorage]": {
required: true,
rangelength: [1,10]
},
"listing[modified]": {
required: true,
},
"listing[itemlocation]": {
required: true,
rangelength: [1,60]
},
"listing[shipinternationally]": {
required: true,
},
"listing[returnsallowed]": {
required: true,
},
"listing[paypalconfirmed]": {
required: true,
},
	           "listing[paypalemail]": {
	                required: true,
	                email: true,

	            },
	            "listing[deviceimei]": {
	                required: true,
					digits:true,
					maxlength: 15,
	            },
	            
	        },
	        // Specify the validation error messages
	        messages: {
	            "listing[headline]": {
		required: "Please enter a heading",
		rangelength: "Enter a heading between 6 to 60 chararcters",

	},
	         "listing[description]": {
		required: "Enter a description",
		rangelength: "Description should be between 6 and 140",
		},

		"listing[devicecondition]": {
		required: "Please select a valid device condition",
		},
		"listing[askprice]": {
		required: "You need to enter a price for your phone",
		digits: "Please enter only digits",
		rangelength: "Really? your phone is worth that much",
		
		},
		"listing[accessories]": {
		required: "Enter all the accessories that come with the phone. Enter none for nothing",
		},

		"listing[deivcecolor]": {
		required: "Enter the color of your phone",
		},
		"listing[devicestorage]": {
		required: "Enter the storage capacity of the phone",
		rangelength: "Type a realistic value",
		
		},
		"listing[modified]": {
		required: "Please select if you have modified the device",
		},
		"listing[itemlocation]": {
		required: "Enter a valid location where your phone is located",
		rangelength: "Just write name of the city.",
		
		},
		"listing[shipinternationally]": {
		required: "Please select if you will ship internationally",
		},
		"listing[returnsallowed]": {
		required: "Please select if you will allow returns",
		},
		"listing[paypalconfirmed]": {
		required: "Please select if you want the buyer to have a paypal confirmed address",
		},
			           "listing[paypalemail]": {
			                required: "Enter the paypal email address where you want to receive the money",
			                email: "Please enter a valid email address",

			            },
			            "listing[deviceimei]": {
			                required: "Enter the valid device IMEI.",
							digits: "Please enter only digits",
							maxlength: "IMEI numbers are just 15 digits, your number is more than that"
			            }
	        },
	
	
		    debug: true,
		

	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
	  });
	
	
	
	
	
	
	
	$(function() {

	    // Setup form validation on the #registerform element
	    $("#new_comment").validate({

	        // Specify the validation rules
	        rules: {

	            "comment[commentbody]": {
	                required: true,
	            },
	           

	        },
	        // Specify the validation error messages
	        messages: {

	            "comment[commentbody]": {
	                required: "Please write something first. Empty comments not allowed",
	            },

	           
	        },

	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
	  });
	
	
	$(function() {

	    // Setup form validation on the #registerform element
	    $("#new_review").validate({

	        // Specify the validation rules
	        rules: {

	            "review[reviewbody]": {
	                required: true,
	            },


	        },
	        // Specify the validation error messages
	        messages: {

	            "review[reviewbody]": {
	                required: "Please write something first. Empty reviews not allowed",
	            },


	        },

	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
	  });
	
	
	
	
		$(function() {

		    $("form.edit_listing").validate({
		        rules: {
		            "listing[headline]": {
						required: true,
						rangelength: [6,60],
						},

					"listing[askprice]": {
						required: true,
						digits: true,
						},

		           "listing[paypalemail]": {
		                required: true,
		                email: true,
		            }

		        },
		        messages: {
		            "listing[headline]": {
						required: "Please enter a heading",
						rangelength: "Enter a heading between 6 to 60 chararcters",

										},

					"listing[askprice]": {
						required: "You need to enter a price for your phone",
						digits: "Please enter only digits",
										},
			           "listing[paypalemail]": {
				         required: "Enter the paypal email address where you want to receive the money",
				         email: "Please enter a valid email address",
						}
		        },


			    debug: true,


		        submitHandler: function(form) {
		            form.submit();
		        }
		    });
		  });

	


	});

