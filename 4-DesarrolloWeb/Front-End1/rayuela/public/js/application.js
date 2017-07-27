$(document).ready(function() {
	//---------->Definiendo variables
	//guardan si se presiono o no la tecla para detener
	teclaS = false;
	teclaL = false;
	winner = "player1"
	winnerPoints = 0;

//----------------===========Aqui me quede=================

	//Se activa una funcion cuando se hace click al boton con id #start_btn
	$( "#start_btn" ).click(function(){
		//inicia el movimiento en las casillas para ambos jugadores.
		lanzarMoneda("#Player1");
		lanzarMoneda("#Player2");
		//llamamos a la funcion deterctar tecla
		$(window).bind(detectarTecla());

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
		} else if (player == "#Player2" && teclaL == true){
			console.log("Player 2 termino");
		}
		//si el indice de current_player es menor a 30 (lo largo de la pista) has la funcion timeout, que lo que hace es volver a dirigirte a esta misma funcion y dar un timepo de 50 milisegundos, para que le proceso sea lento y visible al usuario.
		else if (30> $($current_player).index()){
			setTimeout(function(){
				lanzarMoneda(player);
			},50);
		};
		//llamamos a la funcion que me dice quien gano, primero guardo el texto del td donde se quedo la class active en ambos players
		var tp1 = $("#Player1").find(".active").text();
		var tp2 = $("#Player2").find(".active").text();
		//si ambos jugadores pararon su moneda a tiempo llamamos a una funcion que compara quien esta mas cerca de la meta
		if (teclaS && teclaL ){
			winerIs(tp1, tp2);
		// si uno de los jugadores no presiono su tecla a tiempo, por default el otro jugador gana.
		}else if(teclaS || teclaL){
			winerforDefault(tp1, tp2);
			//si ninguno de los jugadores se detuvo a tiempo y llegaron al final, ambos pierden.
		}else if(parseInt(tp1) == 30 && parseInt(tp2) == 30) {
			$(".ganador").html("<h3>Ambos pierden!!</h3>");
			winner = "Ninguno";
			winnerPoints = - 1;
			//con este post le envio la informacion al controller, se coloca el get al que se dirige y los datos que van a ser enviados.
			$.post("/game_done",{winner: winner, winnerPoints: winnerPoints});
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

		 	console.log ("presiono la tecla s!! " + teclaS);
		}
		else if (76 == event.keyCode){
			teclaL = true;
			console.log ("presiono la tecla l!! " + teclaL);
		}
	});
};

	//----------------------->Funcion winerIs, la cual calcula cual de los usuarios quedo mas cercano a la meta y con un if muestra en pantalla con .html el resultado
	function winerIs (tp1,tp2){
		var p1Points = 30 - parseInt(tp1);
		var p2Points = 30 - parseInt(tp2);
		if (tp1 == tp2){
			$(".ganador").html("<h3>Tenemos un Empate!!</h3>");
			winner = "Empate";
			winnerPoints = p1Points;
			console.log("el ganador es: " + winner + " y sus puntos son" + winnerPoints);
			//enviar la informacion al controller
			$.post("/game_done",{winner: winner, winnerPoints: winnerPoints});
		}else if (p1Points > p2Points ){
			$(".ganador").html("<h3>El ganador es el Jugador 2!!</h3>");
			winner = "Player2";
			winnerPoints = p2Points;
			console.log("el ganador es: " + winner + " y sus puntos son" + winnerPoints);
			//enviar la informacion al controller
			$.post("/game_done",{winner: winner, winnerPoints: winnerPoints});
		}else if (p1Points < p2Points) {
			$(".ganador").html("<h3>El ganador es el Jugador 1!!</h3>");
			winner = "Player1";
			winnerPoints = p1Points;
			console.log("el ganador es: " + winner + " y sus puntos son" + winnerPoints);
			//intento para neviar información al archivo de ruby por medio de un post
			$.post("/game_done",{winner: winner, winnerPoints: winnerPoints});
		};

	};

	//--------------------->funcion winerforDefault. si uno de los jugadores no detuvo su moneda a timepo, por default el otro jugador gana.
	function winerforDefault(tp1, tp2){
		if (parseInt(tp1) == 30 && teclaL){
			$(".ganador").html("<h3>El ganador es el Jugador 2!!</h3>");
			winner = "Player2";
			winnerPoints = 30 - parseInt(tp2);
			console.log("el ganador es: " + winner + " y sus puntos son" + winnerPoints);
			$.post("/game_done",{winner: winner, winnerPoints: winnerPoints});
		}else if (parseInt(tp2) == 30 && teclaS){
			$(".ganador").html("<h3>El ganador es el Jugador 1!!</h3>");
			winner = "Player1";
			winnerPoints = 30 - parseInt(tp1);
			console.log("el ganador es: " + winner + " y sus puntos son" + winnerPoints);
			$.post("/game_done",{winner: winner, winnerPoints: winnerPoints});
		};
	};

});
