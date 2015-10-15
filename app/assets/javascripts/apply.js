//$(".first_apply .form_wrapper").hide();
$(".first_apply .get_progression_form").hide();

$("#fill_form").on("click", function (e) {
	e.preventDefault();
	$(this).css("pointer-events", "none");
	$(".form_wrapper").show();
	$(".get_progression_form").hide();
	$(".apply_steps").show();
	$(".step1").show();
	$(".apply_step.active").css("cursor","pointer");
	$("html, body").animate({
		scrollTop: $(".form_wrapper").offset().top - 50
	});
});

$("#get_progression").on("click",function(e){
	e.preventDefault();
	$(".step").hide();
	$(".apply_steps").hide();
	$(".get_progression_form").show();
	$(".form_wrapper").show();

});

// if ($(".modify_apply").length > 0) {
// 	//var step_position = $(".modify_apply").find(".step_position").data("step-position");
// 	//$(".step1").show();
// 	//$(".apply_step.active").removeClass("active");
// 	//$(".apply_step.step_"+step_position).addClass("active");
// };

$("input[name='applicant[has_connection]']").on("click", function() {
	if($("#entourage_true").is(':checked')) {
		$(".entourage_wrapper").show();
		$("textarea[name='precision_entourage']").attr("required","required");
	} else {
		$(".entourage_wrapper").hide();
		$("textarea[name='precision_entourage']").removeAttr('required');
	}
});

$('.next').on('click', function () {
	var current = $(this).data('current');
	var next = $(this).data('next');

	// only validate going forward. If current group is invalid, do not go further
	// .parsley().validate() returns validation result AND show errors

	if (next > current) {
            if (false === $('#apply-step' + current).parsley().validate()) {
                return;
            }

	}
});


$(".apply_step").on("click", function () {
	var next = $(this).data("step");
	var current = $(".apply_step.active").data("step");
	$(".apply_step.active").removeClass("active");
	$(this).addClass("active");
	$(".step" + current).hide();
	$(".step" + next).show();
});

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
}