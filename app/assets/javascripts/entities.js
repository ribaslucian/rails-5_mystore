$(document).ready(function() {

  $('[data-function="remote:model:call"]').click(function() {
    remote_modal_show = '[data-function="remote:modal:show"][data-id="' + $(this).attr('data-id') + '"]';

    // para nao buscar novamente, verificamos se o registro ja foi buscado uma vez
    if ($(remote_modal_show).length > 0) {
      $(remote_modal_show).modal('show')
    } else {

      // buscamos o registro
      $.ajax({
        dataType: 'html',
        url: $(this).attr('data-url')
      }).done(function(data) {
        $('body').append(data);
        $(remote_modal_show).modal('show');
      }).fail(function() {
        alert('Error! Tente novamente mais tarde.');
      });
    }
  });
});
