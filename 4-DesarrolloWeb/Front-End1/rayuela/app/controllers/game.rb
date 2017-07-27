post '/game' do
  p session[:player1] = params[:player1]
  p session[:player2]= params[:player2]
  erb :game
end

post '/game_done' do
  p ganador = params[:winner]
  p puntos = params[:winnerPoints]
  p "l"*50
  if session[:player1] && session[:player2] && params[:winner] && params[:winnerPoints]
    if ganador == "Player1"
      @game=Game.create(player1: session[:player1], player2: session[:player2], winner: session[:player1], score: puntos)
    elsif ganador == "Player2"
      @game=Game.create(player1: session[:player1], player2: session[:player2], winner: session[:player2], score: puntos)
    else
      @game=Game.create(player1: session[:player1], player2: session[:player2], winner: ganador, score: puntos)
    end
  end
  p "s"*50
  p @game
end


get '/game' do
  erb :game
end

get '/results' do
  @allgames=Game.all
  erb :results
end
