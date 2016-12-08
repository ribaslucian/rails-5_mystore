$(document).ready(function() {

  //  apresentar 'loading' nos registros quando clicar pra trocar de pág.
  $('body').on('click', '#paginate a', function(e) {
    loader_show();
  });

  $('body').on('keyup', '#paginate input', function(e) {

    // definimos os elementos relacionados
    paginate = $('#paginate');
    hide_submit = $('#hide_submit', paginate);
    messages = $('#messages', paginate);
    message_invalid = $('#invalid', messages);
    message_current = $('#current', messages);
    message_ok = $('#ok', messages);

    // verificamos se pressionou <Enter>
    if (event.which == 13) {
      page = $(this).val();
      current = paginate.attr('current');
      total = paginate.attr('total');
      url = paginate.attr('url');

      // escondemos todas as mensagens para exibirmos apeans uma
      $('*', messages).addClass('hide');

      // verificamos se o valor digitado é um número maior que zero e menor que q a ultima pagina
      if (!$.isNumeric(page) || page <= 0 || page > total)
        return message_invalid.removeClass('hide');

      if (page == current)
        return message_current.removeClass('hide');

      message_ok.removeClass('hide');
      hide_submit.attr('href', url.replace('_page_', page)).trigger('click');
    }
  });
});
