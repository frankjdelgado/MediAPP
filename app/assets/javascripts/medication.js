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

});