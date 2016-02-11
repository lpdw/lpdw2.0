$(document).ready(function() {
//Haut, haut, bas, bas, gauche, droite, gauche, droite, B, A
    var k = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65],
        n = 0;
    $(document).keydown(function (e) {
        if (e.keyCode === k[n++]) {
            if (n === k.length) {
                var content = '<div id="konami"><button><i class="fa fa-close"></i></button><div><img src="./assets/konami.jpg" /><h3>Site développé par:</h3><h4>- v3.0 -</h4><p>LPDW promo 2015-2016 : <a href="https://www.facebook.com/groups/lpdw2015"><i class="fa fa-facebook-square"></i></a> <a href="https://github.com/orgs/lpdw/teams/lpdw-2015"><i class="fa fa-github-square" style="color:#333333;"></i></a></p><h4>- v2.0 -</h4><p><a href="mailto:ivan.daum@gmail.com">Ivan Daum</a> - <a href="mailto:thomas.wellan@gmail.com">Thomas Maurer</a> - <a href="mailto:cajuste.alain@gmail.com">Alain Cajuste</a> - <a href="mailto:antoine.grelard@gmail.com">Antoine Grélard</a></p></div></div>';
                $("body").before(content);
                console.log("Konami!");
                $("#konami button").on("click", function(){
                    $("#konami").remove();
                });
                return !1
            }
        } else k = 0
    });
});