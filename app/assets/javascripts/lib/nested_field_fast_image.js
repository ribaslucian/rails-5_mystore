$(document).ready(function() {

  // elemento que o usuario ira clicar pra ADICIONAR uma imagem
  image_add = '[data-function="nested_field_fast:image:add"]';

  // elemento que o usuario ira clicar pra REMOVER uma imagem especifica
  image_remove = '[data-function="nested_field_fast:image:remove"]';

  // botao oculto que sera chamando quando o usuario clicar no elemento especifico
  field_add = '[data-function="nested_field_fast:field:add"]';

  // botao oculto que sera chamando quando o usuario clicar no elemento especifico
  field_remove = '[data-function="nested_field_fast:field:remove"]';

  // campo que sera inserido quando o usuario clicar
  field = '[data-function="nested_field_fast:field"]';

  // campo que sera inserido quando o usuario clicar
  image_element = '[data-function="nested_field_fast:image:element"]';

  /* Eventos para a acao de INSERCAO */

    $('body').on('click', image_add, function() {
      // 1º disparamos uma trigger para o botão de adicionar um novo nested field para upload da imagem
      // 2º disparamos uma trigger para clicar no ultimo nested field inserido anteriormente
      $(field_add).trigger('click');
      $(field).last().trigger('click');
    });

    // Ao editar o campo de imagem oficial vamos definir a imagem como fundo de um element visual especial
    $('body').on('change', field, function() {
      loader_show();
      // adicinando um novo elemento HTML
      item = $(image_element).first(); // obtemos o elemento que sera o modelo para os sub-sequentes
      clone = item.clone().removeClass('hide'); // adicionamos visibilidade ao elemento duplicado

      // definindo a imagem selecionada como fundo do elemento
      var file = this.files[0];
      var reader = new FileReader();

      reader.onloadend = function () {
        $('.image-content', clone).html('').css('background-image', 'url(' + reader.result + ')');
      }

      if (file) reader.readAsDataURL(file);
      clone.insertBefore(image_add); // adicionamos o novo item ao documento HTML
      loader_hide(false);
    });

    // Removes um elemento de Imagem e o Campo ao clicar no botao de remocao do elemento
    $('body').on('click', image_remove, function() {
      // 1º identificamos a posicao da imagem que foi clicada no nomento
      // 2º encontramos o botao de remocao do campo relacionado a posicao da imagem e clicamos
      // 3º remover a imagem do documento
      index = $(image_remove).index(this);
      $(field_remove + ':eq(' + index + ')').trigger('click');
      $(this).parents(image_element).remove();
    });

  /* Eventos para a acao de EDICAO */

    $(window).load(function() {

      // verificamos se ha algum campo nested relacionado a entidade de edicao
      if ($(field).length > 0) {
        // percorremos os inputs de imagens já selecionadas
        $(field).each(function() {
            // adicinando um novo elemento HTML
            item = $(image_element).first(); // obtemos o elemento que sera o modelo para os sub-sequentes
            clone = item.clone().removeClass('hide'); // adicionamos visibilidade ao elemento duplicado
            clone.insertBefore(image_add); // adicionamos o novo item ao documento HTML
            $('.image-content', clone).html('').css('background-image', 'url(' + $(this).attr('data-value') + ')');
        });
      }
    });

});
