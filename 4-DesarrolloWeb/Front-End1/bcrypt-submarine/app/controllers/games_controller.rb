get '/score/:user_id' do
  #¿Qué va en esta parte para obtener la puntuación de cada jugador (submarinos destruidos en cada ronda) y número de juegos ganados? Guardamos todas las rondas con el id de ese jugador
  p "rounds"*20
  p @rounds = Round.where(user_id: session[:user_id])
  erb :round
end

post '/games' do
  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las oportunidades de cada jugador, así como la sesión actual? No velo la necesidad de enviar tanta informacion, solo necesitamos al final el score, que es cuantos submarinos destriyo, informacion enviada desde el archivo js y recibida por el params
  p "winner"*20
  p subs_destroyed = params[:nowWinner]
  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda? Creando un objeto de la clase Round.
  p subs_destroyed.to_i + 2
  if subs_destroyed == "2"
    p "winner"*20
    Round.create(user_id: session[:user_id], destroyed_subs: subs_destroyed.to_i, result: "Winner!")
  elsif subs_destroyed == "1"
    p "almost"*20
    Round.create(user_id: session[:user_id], destroyed_subs: subs_destroyed.to_i, result: "Almost!")
  elsif subs_destroyed == "0"
    p "loser"*20
    Round.create(user_id: session[:user_id], destroyed_subs: subs_destroyed.to_i, result: "Loser!")
  end

end

get '/new_game' do
  #¿Qué va en esta parte para redirigir a secret? pues un erb a la pagina secreta.
 erb :secret
end
