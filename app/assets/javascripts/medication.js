$(document).on( "singletap", "#medication-list .delete", function() {
    var id = $(this).parent().data("id");
    $.ajax({
        url: "http://localhost:3000/medication/"+id,
        type: "DELETE"
    })
});
$(function() {
	$('#medication-list').UIEditList({
	    callback : function(item){
	    },
	    movable: false
	});
	$('#addMedication').on('singletap', function() {
        $.UIGoToArticle('#newMedication');
    });
});