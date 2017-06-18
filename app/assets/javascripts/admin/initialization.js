$(document).on("turbolinks:load", function() {
	$("select.select2").removeClass("select2-hidden-accessible")
	$("span.select2-container").remove()
	$( ".select2" ).select2({
	  theme: "bootstrap",
	  language: "zh-TW"
	});	
})