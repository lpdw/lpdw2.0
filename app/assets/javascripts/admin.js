$(document).ready(function() {
    $(".option_admin_applicants div").hide(0);

    $(".option_admin_applicants .option_admin_setting").on("click",function(){
        var parent = $(this).parent();
        $(".option_admin_applicants div").hide(200);
        if(parent.find('div').is(":hidden")) {
            parent.find('div').show(100);
        }

});
});
