$(document).ready(function() {
	//---------->Definiendo variables
	//guardan si se presiono o no la tecla para detener
	teclaS = false;
	teclaL = false;
	//guardan si el jugador se detuvo antes de llegar a la meta o no
	jugador1meta = false;
	jugador2meta = false;

	//Se activa una funcion cuando se hace click al boton con id #start_btn
	$( "#start_btn" ).click(function(){
		//inicia el movimiento en las casillas para ambos jugadores.
		lanzarMoneda("#Player1");
		lanzarMoneda("#Player2");
		//llamamos a la funcion deterctar tecla
		$(window).bind(detectarTecla());
		//llamamos a la funcion que me dice quien gano

	});



	//------------------------>Funcion lanzar moneda: quita y agrega la clase "active" a las celdas en la tabla, tiene un setTimer para hacer el movimienot lento y observable al usuario.
	function lanzarMoneda(player) {
		//guardamos en la variable el elemento actual que tiene asignada la calse "active" y se la quitamos con removeClass
		var $current_player = $(player).find(".active").removeClass("active");
		//al elemento siguiente de current_player, le agregamos la class active
		$current_player.next().addClass("active");
		//si el Player1 presiona la tecla S, se detiene el avance, lo mismo para el user 2 con la tecla l
		if (player == "#Player1" && teclaS == true){
			console.log("Player 1 termino");
			//el jugar de detebe antes de llegar a la meta, activo la variable.
			judador1meta = true;
		} else if (player == "#Player2" && teclaL == true){
			console.log("Player 2 termino");
			jugador2meta == true;
		}

		//si el indice de current_player es menor a 30 (lo largo de la pista) has la funcion timeout, que lo que hace es volver a dirigirte a esta misma funcion y dar un timepo de 50 milisegundos, para que le proceso sea lento y visible al usuario.
		else if (30> $($current_player).index()){
			setTimeout(function(){
				lanzarMoneda(player);
			},50);
		};
	};

	//------------------------>Funcion para detectar la tecla presionada por el usuario
function detectarTecla (){
	//detecatamos que le usuario presiono una tecla
	$(window).bind("keyup", function(){
		//si la tecla fue la s(codigo 83)  o l (codigo 79) activa la variable
		if (83 == event.keyCode){
			teclaS = true;
			//guardamos el id del td donde se encuentra la class active
			tp1 =$("#Playe1").find(".active").attr("id");
		 	console.log ("presiono la tecla s!! " + teclaS + tp1);
		}
		else if (76 == event.keyCode){
			teclaL = true;
			tp2 =$("#Playe1").find(".active").attr("id");
			console.log ("presiono la tecla l!! " + teclaL + tp2);
		}
	});
};

});
