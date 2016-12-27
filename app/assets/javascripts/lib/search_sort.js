$(document).ready(function() {

  // apresentar 'loading' nos registros quando o usuário estiver ordenando
  $('body').on('click', 'table thead a', function(e) {
    loader_show();
  });

  //  apresentar 'loading' nos registros quando pressionar enter na pesquisa
  $('body').on('keyup', '#search_input', function(e) {
    if (e.which == 13)
      $('#search_input').addClass('loading');
  });
});
