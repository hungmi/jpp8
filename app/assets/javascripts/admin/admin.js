//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require admin/jquery.dataTables.min
//= require admin/dataTables.bootstrap.min
//= require admin/dataTables.responsive
//= require Chart.bundle
//= require chartkick
//= require select2
//= require select2_locale_zh-TW
//= require turbolinks

$(document).on("turbolinks:load", function() {
	$( ".select2" ).select2({
	  theme: "bootstrap",
	  language: "zh-TW"
	});	
})
