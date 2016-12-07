$(document).ready(function() {
  //  apresentar 'loading' nos registros quando clicar pra trocar de pág.
  $('body').on('click', '.paginate a', function(e) {
    loader_show();
  });

  invalid_message = '.invalid_page_message';
  current_message = '.current_page_message';
  ok_message = '.ok_message';

  $('body').on('keyup', '.paginate input', function(e) {
    // verificamos se pressionou <Enter>
    if (event.which == 13) {

      page = $(this).val();
      current = $('.paginate').attr('paginate-current');
      total = $('.paginate').attr('paginate-total');
      url = $('.paginate').attr('paginate-url');

      // verificamos se o valor digitado é um número maior que zero
      if (!$.isNumeric(page) || page <= 0) {
        $(current_message).addClass('hide');
        return $(invalid_message).removeClass('hide');
      }

      if (page == current) {
        $(invalid_message).addClass('hide');
        return $(current_message).removeClass('hide');
      }

      $(invalid_message).addClass('hide');
      $(current_message).addClass('hide');
      $(ok_message).removeClass('hide');

      $('.hide_button_submit_input').attr('href', url.replace('_page_', page)).trigger('click');
    }
  });
});
