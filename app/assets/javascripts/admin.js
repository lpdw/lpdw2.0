$(document).ready(function() {
    $(".option_admin_applicants div").hide();

    $(".option_admin_applicants .option_admin_setting").on("click", function() {
        var parent = $(this).parent();
        var self = this;
        $(".option_admin_applicants").each(function(){

            $(this).find(".option_admin_setting").not(self).removeClass("opened");
        });

        $(".option_admin_applicants .block_opened").hide();

        if(!$(this).hasClass("opened")) {
            $(this).addClass("opened");
            parent.find('.block_opened').show();
        } else {
            $(this).removeClass("opened");
            parent.find('.block_opened').hide();
        }


    });

    var opened = false;
    var navHeight = $(".nav-sidebar").height();

    $(".nav-sidebar").css("height", "0");

    $(".menu-toggle").on("click", function() {

        if (!opened) {
            $(".nav-sidebar").stop().animate({
                height: navHeight
            }, 300);
            opened = true;
        } else {
            $(".nav-sidebar").stop().animate({
                height: 0
            }, 300);
            opened = false;
        }

    });

    $("#nice-scroll").niceScroll({
        enablescrollonselection: true,
        styler: "fb",
        cursorcolor: "#6B99B8"
    });

    $('#date-interview').datetimepicker({
        minDate: new Date()
    });

    $('.has-events').on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        var body = $("body");
        var interview = $(this).find('#interview');
        var title_popup = $(this).find('#title-popup');
        var html_popup = '<div id="interview_popup" class="interview_popup" ><div class="head"><h1>Entretien le '+ title_popup.html() +' avec:</h1><a id="close_interview_popup" class="btn-close" href="javascript:;"><i class="fa fa-close fa-2x"></i></a></div><div id="nice-scroll" class="nice-scroll">' + interview.html() + ' </div></div><div id="overlay" class="overlay"></div>';
        body.append(html_popup);
    });
    $(document).on('click', "#close_interview_popup,#overlay", function(e) {
        e.preventDefault();
        e.stopPropagation();
        var popup = $('#interview_popup');
        var overlay = $('#overlay');
        popup.remove();
        overlay.remove();
    });


});