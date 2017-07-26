$(document).ready(function() {

	//Se activa una funcion cuando se hace click al boton con id #start_btn
	$( "#start_btn" ).click(function(){ 
		lanzarMoneda();
	});

	//------------------------>Funcion lanzar moneda: quita y agrega classes a las celdas en la tabla.
	function lanzarMoneda() {
		var $current_player = $("#Player1").find(".active").removeClass("active");
		$current_player.next().addClass("active");
		if (29>= $($current_player).index()){
			setTimeout(function(){
				lanzarMoneda();
			},50);
		};
	};
		



});










