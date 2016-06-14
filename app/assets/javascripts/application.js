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
//= require turbolinks
//= require_tree .

$(function() {
  $(document).ready(function(){

    $('.month_dropdown').click(function(){
      var list = $(this).next();
      list.toggle();
      console.log(list)
      if ($('.month_articles').is(':visible')) {
        $(this).html("∨");
      }
      else {
        $(this).html(">");
      }
    });


    $('#show_comment_form').click(function(){
      $('.comments_wrapper form').toggle();
      if ($('.comments_wrapper form').is(':visible')) {
        $('#show_comment_form').html("∨");
      }
      else {
        $('#show_comment_form').html(">");
      }
    });
  });

  initPage();
});

$(window).bind('page:change', function() {
  $('.comments_wrapper form').hide();
  $('.month_articles').hide();
  initPage();
});

function initPage() {
  $(document).ready(function(){

    $('.month_dropdown').click(function(){
      var list = $(this).next();
      list.toggle();
      console.log(list)
      if ($('.month_articles').is(':visible')) {
        $(this).html("∨");
      }
      else {
        $(this).html(">");
      }
    });

    $('#show_comment_form').click(function(){
      $('.comments_wrapper form').toggle();
      if ($('.comments_wrapper form').is(':visible')) {
        $('#show_comment_form').html("∨");
      }
      else {
        $('#show_comment_form').html(">");
      }
    });
  });
}
