
//función que inicia el juego
function start_game(subOne, subTwo) {
  console.log("Entro  a la funcion start_game");
  //variable que tiene un arreglo asignado con la posición de los dos submarinos a destruir
  var winner = randomCell();
  var destroyer_sub = 0;

    $('.cell').on("click", function(evento){
      //aqui se guarda el id que el usuario presiono.
      var playerClick = $(this).attr('id');
      //guarda la url del controlador en la que nos encontramos
      var url = $('#play').attr('action');
      console.log(playerClick);
      console.log(url);
      //¿qué debería ir aquí para conocer el número de submarinos destruidos o si el jugador es ganador? llamar a la funcion won, cuyos argumentos son el id del cell seleccionado y donde estan los submarinos.
      won(playerClick, winner)

      countForPlay += 1;
      //¿que debería ir aquí para mandar al controlador el conteo de submarinos destruidos y el conteo de oportunidades por ronda?


    });

  //función para conocer el número de submarinos destruidos o si el jugador es ganador
  function won(playerValue, subValue) {
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    if (countForPlay <= 2) {
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('#' + playerValue).css("background","red");
        //variable que lleva el conteo de submarinos destruidos
        nowWinner += 1;
        //esto imprime en el html la cantidad de submarinos destruidos
        $("h3").html(" Destroyed Submarines: " + nowWinner );
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    //¿que debería ir aquí para conocer el número de submarinos destruidos y conocer ganador? Mandar llamar la funcion score
      score(nowWinner);
  }
}

//función que muestra el score del jugador
function score(value) {
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  $("#container").empty();//elimina todo lo que este dentro de #container
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'white');
  $('#container').css('background','#FFFFFF');
  //¿qué debería ir aquí para generar las celdas cada vez que se inicia juego? Un arreglo que genere las 9 celdas y les asigne el id
  var count;
  for (count = 1; count < 10; count++){
    $("#container").append('<div class="cell" ></div>')
    $('.cell:last').attr("id", "c" + count);
  }


}

//función que genera la posición de los dos submarinos
var randomCell = function() {
  //variables para asignar el valor de la posición de los submarinos
  var subOne = 0;
  var subTwo = 0;
  //¿qué debería ir aquí para generar las dos posiciones de los submarinos? Con un afuncion que genera numeros aleatorios
  subOne = 1 + Math.floor(Math.random() * 9);
  subTwo = 1 + Math.floor(Math.random() * 9);
  if (subOne === subTwo){
    subTwo = 1 + Math.floor(Math.random() * 9);
  }
  console.log(subOne);
  console.log(subTwo);
  var valueSubOne = "c" + subOne;
  var valueSubTwo = "c" + subTwo;
  return [valueSubOne, valueSubTwo]
}


$(document).ready(function(){
    console.log("Ya estoy en el jq");
  	$('#play').on("submit", function(evento){
      console.log("Ya estoy en submit");
  	  evento.preventDefault();
      var url = $('#play').attr('action');
      $('#win').text(" ");
      //variable que lleva el conteo de oportunidades por ronda
      countForPlay = 0;
      //variable que lleva el conteo de submarinos destruidos
      nowWinner = 0;
      //variable que termina el juego 'alert game over'
      status = false;
      //¿que debería ir aquí para comenzar el juego? Primero hacer el tablero y despues iniciar el juego
      resetInit();
      start_game();
	  });

});
