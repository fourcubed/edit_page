// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function cmsInit() {
  jQuery(document).ready(function(){
    tinyMCE.init({
      mode: 'textareas',
      theme: 'advanced',
      theme_advanced_toolbar_location: 'top'
    });
  });
}
