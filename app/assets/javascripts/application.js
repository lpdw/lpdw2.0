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
//= require bootstrap-sprockets
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

    $(".close-alert").click(function(){
        var body = $("html, body");
        $(this).parent().slideUp();
        return false;
     });

    var tw_url = "https://cdn.syndication.twimg.com/widgets/followbutton/info.json?lang=fr&screen_names=";
    var fb_url = "https://graph.facebook.com/";

    var fb_site = "https://facebook.com/";
    var tw_site = "https://twitter.com/";

    $.ajax({
        url: tw_url+"ivandaum",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".licence .tw-retour").html('<i class="fa fa-twitter"></i>'+data[0].followers_count);
            $(".licence .tw-retour").attr("href", tw_site+"ivandaum");
        }
    });

    $.ajax({
        url: fb_url+"lpdwm",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".licence .fb-retour").html('<i class="fa fa-facebook"></i>'+data.likes);
            $(".licence .fb-retour").attr("href", fb_site+"lpdwm");
        }
    });

        $.ajax({
        url: tw_url+"FacLabUcp",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".faclab .tw-retour").html('<i class="fa fa-twitter"></i>'+data[0].followers_count);
            $(".faclab .tw-retour").attr("href",tw_site+"FacLabUcp");

        }
    });
    $.ajax({
        url: fb_url+"faclab",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".faclab .fb-retour").html('<i class="fa fa-facebook"></i>'+data.likes);
            $(".faclab .fb-retour").attr("href", fb_site+"faclab");
        }
    });

    $(".navbar-toggle").click(function(e){
        e.preventDefault();

         if($(".navbar-collapse").hasClass("in")){
            document.documentElement.style.overflow = 'auto';
        }else{
            document.documentElement.style.overflow = 'hidden';
        }
     });


});
