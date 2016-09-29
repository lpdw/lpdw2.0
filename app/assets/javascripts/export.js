$(document).ready(function(){
    var table = $('#myTable').DataTable();

    $('#btn-export').on('click', function(){
        console.log("click");
        $('#myTable').table2excel({
            exclude: ".action",
            name: "Worksheet Name",
            filename: "List" //do not include extension
        });
    });
});