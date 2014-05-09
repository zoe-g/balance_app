//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {

	$( "#paid" ).click(function() {
		$( "#paid-option" ).show();
		$( "#received-option" ).hide();
		$( "#transfer-option" ).hide();
		$( "#spend-options" ).show();
		$( "#transaction_transaction_type_id" ).val(1);
	});

	$( "#received" ).click(function() {
		$( "#paid-option" ).hide();
		$( "#received-option" ).show();
		$( "#transfer-option" ).hide();
		$( "#spend-options").hide();
		$( "#transaction_transaction_type_id" ).val(2);
	});

	$( "#transfer" ).click(function() {
		$( "#paid-option" ).hide();
		$( "#received-option" ).hide();
		$( "#transfer-option" ).show();
		$( "#spend-options").hide();
		$( "#transaction_transaction_type_id" ).val(3);
	});

});