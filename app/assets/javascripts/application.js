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
$(document).ready(function() {
        topScroll();

        $(window).scroll(function(){
            topScroll();
        });

        function topScroll(){
            if($(window).scrollTop() == 0){
                $(".scroll-top").hide();
            } else{
                $(".scroll-top").show();
            }
        }

    $(".scroll-top").click(function(){
        var body = $("html, body");
        body.animate({scrollTop:0}, '5000', 'swing', function() {

        });
        return false;
    });

    $(".close-alerte").click(function(){
        var body = $("html, body");
        $(this).parent().slideUp();
        return false;
    });
});