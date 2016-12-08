/**
 * Função básica do evento de clicar fora de um element 
 */
$.fn.clickOut = function (callback, selfDestroy) {
    var clicked = false;
    var parent = this;
    var destroy = selfDestroy || true;

    parent.click(function () {
      clicked = true;
    });

    $(document).click(function (event) {
      if (!clicked)
        callback(parent, event);

      clicked = false;
    });
};

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
  $('body').css('overflow', 'hidden');
  $('._page-loader').show();
}

/**
 * Esconder o loader completo da pag.
 *
 * @return {void}
 */
function loader_hide() {
  // apresentar o scroll da pág.
  $('body').css('overflow', 'auto');
  $('._page-loader').hide();
   $("html, body").animate({ scrollTop: 0 }, "slow");
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
