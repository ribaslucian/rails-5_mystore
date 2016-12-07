$(document).ready(function() {
  // ao sair de uma página, mostrar o loader.
  $(window).on('beforeunload', function () {
    loader_show();
  });

  // esconder o loader da página após concluir o carregamento.
  $(window).bind('load', function () {
    loader_hide();
  });
});
