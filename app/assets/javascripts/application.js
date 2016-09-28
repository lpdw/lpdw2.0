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
//= require jquery.turbolinks
//= require jquery_ujs
//= require parsley.min.js
//= require nested_form_fields
//= require bootstrap-sprockets
//= require jquery.nicescroll
//= require moment
//= require bootstrap-datetimepicker
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

    $(".close-alert").click(function(){
        var body = $("html, body");
        $(this).parent().slideUp();
        return false;
    });

    var tw_url = "https://cdn.syndication.twimg.com/widgets/followbutton/info.json?lang=fr&screen_names=";
    var fb_url = "http://api.facebook.com/restserver.php?format=json&method=links.getStats&urls=https://www.facebook.com/";

    var fb_site = "https://facebook.com/";
    var tw_site = "https://twitter.com/";

    $.ajax({
        url: tw_url+"lpdw_ucp",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".licence .tw-retour").html('<i class="fa fa-twitter"></i>'+data[0].followers_count);
            $(".licence .tw-retour").attr("href", tw_site+"lpdw_ucp");
        }
    });

    $.ajax({
        url: fb_url+"lpdwm",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".licence .fb-retour").html('<i class="fa fa-facebook"></i>'+data[0].like_count);
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
            $(".faclab .fb-retour").html('<i class="fa fa-facebook"></i>'+data[0].like_count);
            $(".faclab .fb-retour").attr("href", fb_site+"faclab");
        }
    });
    $.ajax({
        url: tw_url+"UniversiteCergy",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".universite .tw-retour").html('<i class="fa fa-twitter"></i>'+data[0].followers_count);
            $(".universite .tw-retour").attr("href",tw_site+"UniversiteCergy");

        }
    });
    $.ajax({
        url: fb_url+"279510485409212/likes",
        type: 'GET',
        crossDomain: true,
        dataType: 'jsonp',
        success: function(data) {
            $(".universite .fb-retour").html('<i class="fa fa-facebook"></i>'+data[0].like_count);
            $(".universite .fb-retour").attr("href", fb_site+"UniversiteCergyPontoise");
        }
    });

    $(".navbar-toggle").on('click', function(e){
        e.preventDefault();

        if($(".navbar-collapse").hasClass("in")){
            document.documentElement.style.overflow = 'auto';
        }else{
            document.documentElement.style.overflow = 'hidden';
        }
    });

    $(".home-creations .article-creation_wrapper").each(function() {
        $(this).find("img").on('load',function() {
            if( $(this).width() < $(this).height()) {
                $(this).css("width", "100%");
            } else {
                $(this).css("height", "100%");
            }
        });
    });


    //Jquery menu color
    if( $('#categ_currant').attr('value') ) {

        $('.bp nav.type a').each(function() {
            if( $(this).attr('data-filter-type') == $('#categ_currant').attr('value') ) {
                $(this).addClass('active');
            }
        });

    } else {
        $('.bp nav.type a').each(function() {
            if( $(this).attr('data-filter-type') == 'all') {
                $(this).addClass('active');
            }
        });
    };

});
