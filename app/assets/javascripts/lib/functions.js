function empty(value){
  return !$.trim(value)
}

/**
 * Apresentar o loader completo da pag.
 *
 * @return {void}
 */
function loader_show() {
  // esconder o scroll da pág.
  $('.dimmer').dimmer({duration: { show: 500, hide: 0}}).dimmer('hide');
  $('body').css('overflow', 'hidden');
  $('._page-loader').show();
}

/**
 * Esconder o loader completo da pag.
 *
 * @return {void}
 */
function loader_hide(return_scroll) {
  // apresentar o scroll da pág.
  $('body').css('overflow', 'auto');
  $('._page-loader').hide();
  if (return_scroll)
    $('html, body').animate({ scrollTop: 0 }, 'fast');
}

/**
 * Aprensa um log no console do navegador.
 *
 * @param  {[type]}
 * @return {void}
 */
function log(content) {
  console.log(content);
}

function hide_me_and_show(me, element_show) {
  me.hide();
  $(element_show).show();
}

function hide_show(element_to_hide, element_to_show) {
  $(element_to_hide).hide();
  $(element_to_show).show();
}


/**
 * Prepara um elemento para iniciar um requisicao remota.
 * Bloqueia o elemento de mandar novas chamadas e manipula visualmente.
 *
 * @param  {object} element_trigger Elemento que vai disparar a requisicao
 * @return {void}
 */
function remote_call_start(element_trigger) {
  // escondemos o elemento da triggler
  element_trigger.hide();

  // caso possua um loader, mostrar
  $('[data-function="loader"][data-id="' + element_trigger.attr('data-id') + '"]').removeClass('hide');
}

/**
 * Prepara um elemento para concluir um requisicao remota.
 * Bloqueia o elemento de mandar novas chamadas e manipula visualmente.
 *
 * @param  {object} element_trigger Elemento que vai disparar a requisicao
 * @return {void}
 */
function remote_call_finish(element_trigger) {
  // caso possua um loader, esconder
  $('[data-function="loader"][data-id="' + element_trigger.attr('data-id') + '"]').addClass('hide');

  // monstramos o elemento da triggler
  element_trigger.show();
}
