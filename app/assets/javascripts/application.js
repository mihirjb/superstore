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
//= require bootstrap
//= require social-share-button
//= require twitter/typeahead   
//= require fancybox
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function() {
	$("#social_share_box").fancybox().trigger('click');
    


	var imgArray = ['../bgnew.jpg',
					'../bgnew1.jpg',
					'../hero.jpg'
	               ]
	var nextBG = "url('../clear-dark.png'),url(" + imgArray[Math.floor(Math.random() * imgArray.length)] + ") center center fixed no-repeat";
	$('#slideshow').css("background", nextBG);              

	setInterval(function(){
	    nextBG = "url('../clear-dark.png'), url(" + imgArray[Math.floor(Math.random() * imgArray.length)] + ") center center fixed no-repeat";
	    $('section.search').fadeOut('slow', function() { 
	        $(this).css("background", nextBG).fadeIn('slow'); })                   
	}, 8000); // 3 second interval


		$("#iphones").hide("slow");
		  $("#ipads").hide("slow");
			$("#choice").show("slow");
		



		$( "#iphbtn" ).click(function( event ) {

		    event.preventDefault();

			$("#iphones").show("slow");
			  $("#ipads").hide("slow");
			 	$("#choice").hide("slow");
			

		});
			$( "#ipdbtn" ).click(function( event ) {

			    event.preventDefault();

				$("#iphones").hide("slow");
				  $("#ipads").show("slow");
				$("#choice").hide("slow");


			});
			$( "#choicebtn" ).click(function( event ) {

			    event.preventDefault();
				$("#choice").show("slow");
				$("#iphones").hide("slow");
				  $("#ipads").hide("slow");


			});
			$( "#choicebtns" ).click(function( event ) {

			    event.preventDefault();
				$("#choice").show("slow");
				$("#iphones").hide("slow");
				  $("#ipads").hide("slow");


			});
			
	
	$("#orders").hide("slow");
	  $("#reviews").hide("slow");
	  $("#listings").show("slow");
	  $("#activelistings").hide("slow");
	  $("#pendinglistings").hide("slow");
	  $("#soldlistings").hide("slow");
	  $("#soldorders").hide("slow");
	  $("#boughtorders").hide("slow");
	  $("#buyerreview").hide("slow");
	  $("#sellerreview").hide("slow");



	$( "#listingbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").show("slow");
		  $("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");

	});

	$( "#activelistingbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow");
		  $("#activelistings").show("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");

	});


	$( "#pendinglistingbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow");
		  $("#activelistings").hide("slow");
		  $("#pendinglistings").show("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");

	});


	$( "#soldlistingbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow");
		  $("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").show("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");

	});



	$( "#orderbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").show("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow"); 
		$("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");
	});
	
	
	$( "#boughtorderbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow"); 
		$("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").show("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");
	});



	$( "#soldorderbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow"); 
		$("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").show("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");
	});
	
	
	$( "#reviewbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").show("slow");
		  $("#listings").hide("slow"); 
		$("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").hide("slow");
	});


	$( "#buyerreviewbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow"); 
		$("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").show("slow");
		  $("#sellerreview").hide("slow");
	});


	$( "#sellerreviewbtn" ).click(function( event ) {

	    event.preventDefault();

		$("#orders").hide("slow");
		  $("#reviews").hide("slow");
		  $("#listings").hide("slow"); 
		$("#activelistings").hide("slow");
		  $("#pendinglistings").hide("slow");
		  $("#soldlistings").hide("slow");
		  $("#soldorders").hide("slow");
		  $("#boughtorders").hide("slow");
		  $("#buyerreview").hide("slow");
		  $("#sellerreview").show("slow");
	});


  $("a.fancybox").fancybox();

	
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



