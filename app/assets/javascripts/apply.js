$(".form_wrapper").hide();

$("#fill_form").on("click", function(e) {
	e.preventDefault();
	$(".form_wrapper").show();
	$(".step1").show();
});

$(".gotostep2").on("click", function(e) {
	e.preventDefault();
	$(".step1").hide();
	$(".step2").show();
});

$(".gotostep3").on("click", function(e) {
	e.preventDefault();
	$(".step2").hide();
	$(".step3").show();
});

$(".gotostep4").on("click", function(e) {
	e.preventDefault();
	$(".step3").hide();
	$(".step4").show();
});