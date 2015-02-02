
$(document).on( "singletap", "#med-list .delete", function() {
    var id = $(this).parent().data("id");
    $.ajax({
        url: "http://localhost:3000/treatment/"+id,
        type: "DELETE"
    })
});

$(function() {
	$('#addButton').on('singletap', function() {
        $.UIGoToArticle('#newTreatment');
    });

	$(document).on( "singletap", "#med-list .icon-checkmark", function() {
    	var value = $(this).parent().parent().data("id");
    	console.log(value);
        $.ajax({
            url: "http://localhost:3000/treatment/last_taken?id="+value,
            type: "PUT"
        })
         $(this).remove();
    });


	$('#med-list').UIEditList({
	    callback : function(item){
	    },
	    movable: false
	});

	$( "#autocomplete-input" ).focus(function(){

	    var $myText = $(this);
	    var $ul = $( "#autocomplete")


	    $myText.data("value", $myText.val());

	    setInterval(function() {
	        var data = $myText.data("value"),
	        value = $myText.val();

	        if (data !== value && $( "#autocomplete-input").is(":focus")) {
	            $myText.data("value", value);

	            if ( value && value.length > 2 ) {
	                $("#autocomplete").empty();
	                $.ajax({
	                    url: "http://localhost:3000/medication/autocomplete.json",
	                    dataType: "json",
	                    crossDomain: true,
	                    data: {
	                        q: value
	                    }
	                })
	                .then( function ( response ) {
	                    html = ""; 
	 
	                    $.each( response, function ( i, val ) {
	                        html += "<li data-id='"+val.id +"'>" + val.name + "</li>";
	                    });
	                    $ul.html( html );
	                });
	            } 
	        }
	    }, 400);
	})

	$(document).on( "singletap", "#autocomplete li", function() {
	    $("#autocomplete-input").val($(this).text());
	    $("#treatment_medication_id").val($(this).data("id"));
	    $("#autocomplete").empty();
	});

	$('.pickdate').pickadate();
	$('.picktime').pickatime({
	    interval: 60
	});
});