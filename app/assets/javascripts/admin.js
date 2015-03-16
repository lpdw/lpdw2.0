$(document).ready(function() {
    $(".option_admin_applicants div").hide(0);

    $(".option_admin_applicants .option_admin_setting").on("click",function(){
        var parent = $(this).parent();
        $(".option_admin_applicants div").hide(200);
        if(parent.find('div').is(":hidden")) {
            parent.find('div').show(100);
        }
	});

    var opened = false;
    var navHeight = $(".nav-sidebar").height();

    $(".nav-sidebar").css("height", "0");

    $(".menu-toggle").on("click", function() {

    	if(!opened) {
    		$(".nav-sidebar").stop().animate({height: navHeight }, 300);
    		opened = true;
    	} else {
    		$(".nav-sidebar").stop().animate({height: 0}, 300);
    		opened = false;
    	}

    });

});
