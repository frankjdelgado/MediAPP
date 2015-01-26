$(function() {

    $('#addButton').on('singletap', function() {
      console.log('You pushed my button!');
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