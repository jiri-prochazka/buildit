// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require cocoon



var init_datepicker = function(){
	$('.datepicker').datepicker({
		format: "dd.mm.yyyy",
		weekStart: 1,
		autoclose: 'true'
	});

	$(".progress").slider({
		ticks: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
		ticks_labels: ["0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"],
		ticks_snap_bounds: 30,
		max: 100,
		step: 10
	});


}

$(document).ready(init_datepicker);
$(document).on('page:load', init_datepicker);
$(document).ajaxComplete( init_datepicker);
