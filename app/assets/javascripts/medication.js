$(function() {

    $('#addButton').on('singletap', function() {
        $.UIGoToArticle('#addTreatment');
    });


    $('#med-list').UIEditList({
        editLabel : 'Edit',
        doneLabel : 'Ok',
        deleteLabel : 'Delete',
        callback : function(){
          alert("Se ha terminado");
        },
        deletable: true,
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
                console.log(data+"-"+value);
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
        $("#medication_id").val($(this).data("id"));
        $("#autocomplete").empty();
    });

});