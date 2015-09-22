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
//= require components/google_maps
//= require components/toggle_class
//= require vendor/foundation/foundation
//= require vendor/jquery.matchheight
//= require vendor/jquery-ui
//= require vendor/doubletaptogo
//= require slick.js.js
//= require colorbox
// require_tree .

$(document).foundation();

$(function() {
  $('.colorbox').colorbox();

  $('.colorbox-iframe').colorbox({
    iframe: true,
    width: "550px",
    height: "500px"
  });

  /*
  $('.product').matchHeight({
    byRow: false
  });
  */

  $('.navigation').doubleTapToGo();
});
