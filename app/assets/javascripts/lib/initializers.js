$(document).ready(function() {

  // semantic-ui initializers
  $('.ui.dropdown').dropdown();
  // $('.ui.modal').modal({blurring: true});
  $('.ui.sticky').sticky();
  $('[data-tooltip]').popup();
  $('input[data-content]').popup({on: 'focus'});
  // resumindo utilização do popup {data-inverted}
  $.each($('[data-inverted]'), function(e, k) { $(this).attr('data-tooltip', $(this).attr('data-inverted')) });

  // carousel de imagens
  $('.thumb.carousel').owlCarousel({
    singleItem: true,
    navigation: false
  });

  // configurando estética das mensagens toastr
  toastr.options = {
    'closeButton': true,
    'debug': false,
    'newestOnTop': false,
    'progressBar': true,
    'positionClass': 'toast-top-center',
    'preventDuplicates': false,
    'onclick': null,
    'showDuration': 600,
    'hideDuration': 1000,
    'timeOut': 5000,
    'extendedTimeOut': 1000,
    'showEasing': 'swing',
    'hideEasing': 'linear',
    'showMethod': 'fadeIn',
    'hideMethod': 'fadeOut',
  }
});
