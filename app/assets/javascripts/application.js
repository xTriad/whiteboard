// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload
//= require bootstrap
//= require_tree .

$(document).ready(function() {

  // Changes the color of an individual navbar arrow when the item is
  // highlighted.
  $('#navbar .nav > li').hover(
    function() {
      $(this).find('> span > span').css('border-left-color','#003F76');
    },
    function() {
      $(this).find('> span > span').css('border-left-color','#05568D');
    }
  );
});

// Select the sidebar button associated with the current page and
// change its color.
function selectSidebarButton(controller_name) {

  // var controller_name = window.location.pathname
  //   .replace(/^\//i,'')
  //   .replace(/\/.*$/i,'');

  controller_name = controller_name + '_controller';

  $('#sidebar .nav > li.' + controller_name)
    .addClass('selected')
    .hover(
      function() {
        $(this).removeClass('selected');
      },
      function() {
        $(this).addClass('selected');
      }
    );
}