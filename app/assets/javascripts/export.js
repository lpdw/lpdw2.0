$(document).ready(function(){
    var table = $('#myTable').DataTable();

    $('#btn-export').on('click', function(){
        $('<table>').append(table.$('tr').clone()).table2excel({
            exclude: ".excludeThisClass",
            name: "Worksheet Name",
            filename: "SomeFile" //do not include extension
        });
    });
});