$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

	//esta es la funcion que agregamos para no recargar la pagina completa y solo agregar las respuestas de la abuelita en la página
	$( "form" ).submit(function( event ) {
		//con esta linea detenemos la funcion de submit de cambiarnos de página
		event.preventDefault();
		//serialize guarda la respuesta de los formularios, con la primera linea envio la información a consola para verificar que sea la correcta y con la segunda la asigno a la variable info para poderlo usar mas adelante.
		console.log($( this ).serialize());
 		var info = $( this ).serialize();
 		
 		//esta es una funcion envia la informacion de info al post /abuelita en el controlador (index.rb) y obiente informacion que guarda en data
 		$.post( "/abuelita", info, function( data ){
 			//la informacion de data la cambiamos por lo que ocntenga en selector con id=nuevo en el archivo index.erb. En este caso estaba vacio y lo llenamos con las respuestas de la abuelita. 
 			$("#nuevo").html(data);
 		});

 		
  		

	});

});
