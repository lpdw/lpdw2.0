$(document).ready(function(){
    var table = $('#myTable').DataTable();

    $('#btn-export').on('click', function(){
        console.log("click");
        $('<table>').append(table.$('tr').clone()).table2excel({
            exclude: ".excludeThisClass",
            name: "Worksheet Name",
            filename: "SomeFile" //do not include extension
        });
    });
});