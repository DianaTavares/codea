$(document).ready(function() {

	//basandonos en el ejercicio de abuelitaasincrona, primero creamos una funcion que inicie al hacer click en el submit de form

	$( "form" ).submit(function( event ){

		//detenemos primero que el submit recargue la pagina
		event.preventDefault();


		//hacemos un post de AJAX a JQuery
		$.post( "/rolls",function(data){ 
			$("#die").html(data);

		});
	});
  
});
