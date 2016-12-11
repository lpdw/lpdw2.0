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

    $(document).ready( function () {
        $('#myTable').dataTable( {
            'bAutoWidth': false,
            "columnDefs": [
                { "orderable": false, "targets": 4 }
            ],
         dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf'        ]
            });
    });

    $(document).ready( function () {
        $('.myTable').dataTable( {
            'bAutoWidth': false,
            "columnDefs": [
                { "orderable": false, "targets": 4 }
          ],
	    dom: 'Bfrtip',
            buttons: [
        	'excel', 'pdf'  
   	    ]
        });
    });

    $(document).ready( function () {
        $('.buttons-pdf').children().replaceWith('<img src="https://acrobat.adobe.com/etc/clientlibs/beagle/ace/reimagine/source/img/doccloud/product-icon-acrobat.svg" alt="pdf" width="40px" />');
 	$('.buttons-excel').children().replaceWith('<img src="https://upload.wikimedia.org/wikipedia/fr/thumb/c/cf/Logo_Microsoft_Excel_2013.png/96px-Logo_Microsoft_Excel_2013.png" alt="pdf" width="40px" />');
    });


    $(document).ready(function() {
        var table = $('#myTable').DataTable();
        if(table.context.length != 0){
            var select = $('<select class="form-control"><option  value="">All</option></select>')
                .appendTo( $('#myTable tfoot th.select').empty() )
                .on( 'change', function () {
                    table.column( 4 )
                        .search( $(this).val() )
                        .draw();
                } );
            table.column( 4 ).data().unique().sort().each( function ( d, j ) {
                select.append( '<option value="'+d+'">'+d+'</option>' )
            } );
        }
    } );

});
