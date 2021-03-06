// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require jquery_ujs
//= require activestorage
//= require assets/javascripts/vendor.min
//= require assets/javascripts/theme.min
//= require assets/javascripts/bootstrap.min
//= require assets/javascripts/card.min
//= require assets/javascripts/gmap3.min
//= require assets/javascripts/imagesloaded.pkgd.min
//= require assets/javascripts/isotope.pkgd.min
//= require assets/javascripts/iziToast.min
//= require assets/javascripts/jquery.animateNumber.min
//= require assets/javascripts/jquery.countdown.min
//= require assets/javascripts/jquery.easing.min
//= require assets/javascripts/jquery.easy-autocomplete.min
//= require assets/javascripts/jquery.fancybox.min
//= require assets/javascripts/jquery.inview.min
//= require assets/javascripts/jquery.min
//= require assets/javascripts/modernizr.min
//= require assets/javascripts/nouislider.min
//= require assets/javascripts/owl.carousel.min
//= require assets/javascripts/parallax-scroll.min
//= require assets/javascripts/popper.min
//= require Chart.bundle
//= require chartkick


//= require_tree .


 $(function(){
 $('#form').hide();
 $("#searchB").hide();
 $("#searchB").click(function(){
  $("#form").html( "");
  $('#form').toggle();
  
  $("#searchA").toggle();
  $("#searchB").toggle();
  $(".arrow").css("top", "200px");
})
});
