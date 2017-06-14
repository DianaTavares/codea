//$(document).ready(function () {
  // Escribe tu código aquí
//});
// Dadas la division que contiene todas las pestañas y la de la pestaña que se quiere mostrar, la funcion oculta todas las pestañas a excepcion de esa.
function cambiarPestanna(pestanas, tab) {


    // Obtiene los elementos con los identificadores pasados.
    pestanna = $('#' + tab.id);
    listaPestannas = $('#tabs li');


    // Obtiene las divisiones que tienen el contenido de las pestañas.
    cpestanna = $('#c' +  tab.id);
    listacPestannas = $('#ctabs div');



    listaPestannas.removeClass('active');
    listacPestannas.hide();

    pestanna.addClass('active');
    cpestanna.show();

    // i = 0;
    // Recorre la lista ocultando todas las pestañas y restaurando el fondo y el padding de las pestañas.
    // while (typeof listacPestannas.getElementsByTagName('div')[i] != 'undefined') {
    //     $(document).ready(function () {
    //         $(listacPestannas.getElementsByTagName('div')[i]).css('display', 'none');
    //         $(listaPestannas.getElementsByTagName('li')[i]).css('background', '');
    //         $(listaPestannas.getElementsByTagName('li')[i]).css('padding-bottom', '');
    //     });
    //     i += 1;
    // }

    // $(document).ready(function () {
    //     // Muestra el contenido de la pestaña pasada como parametro a la funcion,
    //     // cambia el color de la pestaña y aumenta el padding para que tape el  
    //     // borde superior del contenido que esta juesto debajo y se vea de este 
    //     // modo que esta seleccionada.
    //     $(ctab).css('display', '');
    //     $(tab).css('background', 'dimgray');
    //     $(tab).css('padding-bottom', '2px');
    // });

}