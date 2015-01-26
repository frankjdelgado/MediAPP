$(function() {

    $('#editButton').on('$.eventStart', function() {
      console.log('You pushed my button!');
    });

    $('#med-list').UIEditList();
});