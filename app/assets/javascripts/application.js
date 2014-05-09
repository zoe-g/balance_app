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
//= require turbolinks
//= require_tree .

$( document ).ready(function() {

	$( "#paid" ).click(function() {
		console.log("hi");
		$( "#transaction_transaction_type_id" ).val(1);
		$( "#paid-option" ).show();
		$( "#received-option" ).hide();
		$( "#transfer-option" ).hide();
		$( "#spend-options" ).show();
	});

	$( "#received" ).click(function() {
		$( "#transaction_transaction_type_id" ).val(2);
		$( "#paid-option" ).hide();
		$( "#received-option" ).show();
		$( "#transfer-option" ).hide();
		$( "#spend-options").hide();
	});

	$( "#transfer" ).click(function() {
		$( "#transaction_transaction_type_id" ).val(3);
		$( "#paid-option" ).hide();
		$( "#received-option" ).hide();
		$( "#transfer-option" ).show();
		$( "#spend-options").hide();
	});

	// $( "#transaction_cleared" ).on("change",function() {
	// 	$( "form" ).submit();
	// 	console.log("click!")
	// });

});