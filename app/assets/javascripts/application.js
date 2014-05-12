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
//= require jquery.cookie
//= require foundation


$(function(){ $(document).foundation(); });

$(window).load(function() { // makes sure the whole site is loaded  
  $("#status").fadeOut(); // will first fade out the loading animation
	$("#preloader").delay(1000).fadeOut("slow"); // will fade out the white DIV that covers the website.
})

$(document).ready(function() {
  
  menuId = $.cookie("menuId");
  var e = document.getElementById(menuId)
  $('.menu-nav-tab').removeClass('active');
  $(".main-content").children().hide();
  $(e).addClass("active");
  $($.cookie("section")).show();
    
  $(".menu-nav-tab").click(function() {
    var parts = this.id.split("-");
    $(".main-content").children().hide();
    $('.menu-nav-tab').removeClass('active');
    $(this).addClass("active");
    $("#" + parts[0]).show();
    $.cookie("menuId",this.id);
    $.cookie("section","#" + parts[0]);
  });
});