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

    $( "#autocomplete" ).on( "filterablebeforefilter", function ( e, data ) {
            var $ul = $( this ),
                $input = $( data.input ),
                value = $input.val(),
                html = "";
            $ul.html( "" );
            if ( value && value.length > 2 ) {
                $ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
                $ul.listview( "refresh" );
                $.ajax({
                    url: "http://localhost:3000/medication/autocomplete.json",
                    dataType: "json",
                    crossDomain: true,
                    data: {
                        q: $input.val()
                    }
                })
                .then( function ( response ) {
                    $.each( response, function ( i, val ) {
                        html += "<li data-id='"+val.id +"'>" + val.name + "</li>";
                    });
                    $ul.html( html );
                    $ul.listview( "refresh" );
                    $ul.trigger( "updatelayout");
                });
            }
    });

    $(document).on( "singletap", "#autocomplete li", function() {
        $("#autocomplete-input").val($(this).text());
        $("#medication_id").val($(this).data("id"));
        $("#autocomplete").empty();
    });

});