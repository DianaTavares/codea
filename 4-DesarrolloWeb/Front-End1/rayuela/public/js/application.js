$(document).ready(function() {

	//Se activa una funcion cuando se hace click al boton con id #start_btn
	$( "#start_btn" ).click(function(){ 
		//inicia el movimiento en las casillas para ambos jugadores.
		lanzarMoneda("#Player1");
		lanzarMoneda("#Player2");
	});

	//------------------------>Funcion lanzar moneda: quita y agrega la clase "active" a las celdas en la tabla, tiene un setTimer para hacer el movimienot lento y observable al usuario.
	function lanzarMoneda(player) {
		var $current_player = $(player).find(".active").removeClass("active");
		$current_player.next().addClass("active");
		if (29>= $($current_player).index()){
			setTimeout(function(){
				lanzarMoneda(player);
			},50);
		};
	};
		



});










