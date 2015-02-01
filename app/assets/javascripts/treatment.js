
$(document).on( "singletap", ".delete", function() {
    var id = $(this).parent().data("id");
    console.log(id);
    $.ajax({
        url: "http://localhost:3000/treatment/"+id,
        type: "DELETE"
    })
});