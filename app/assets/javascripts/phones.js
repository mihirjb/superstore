
$(document).ready(function() {
var path = $(location).attr('href'); 
$('.sidebar-nav a[href*="'+path+'"]').first().prepend("<span class='glyphicon glyphicon-ok green'></span> ");
$('.sidebar-nav a[href*="'+path+'"]').parent('li').addClass("silver-color");
});
