$(document).ready(function() {
//Haut, haut, bas, bas, gauche, droite, gauche, droite, B, A
    var k = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65],
        n = 0;
    $(document).keydown(function (e) {
        if (e.keyCode === k[n++]) {
            if (n === k.length) {
                var content = '<div id="konami"><button><i class="fa fa-close"></i></button><div><img src="./assets/konami.jpg" /><h3>Site développé par:</h3><p>Ivan Daum (ivan.daum@gmail.com) - Chef de projet & développeur front/end</p><p>Thomas Maurer (thomas.wellan@gmail.com) - développeur back/end</p><p>Alain Cajuste (cajuste.alain@gmail.com) - développeur front/end</p><p>Antoine Grélard (antoine.grelard@gmail.com) - Webdesigner & développeur front</p></div></div>';
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