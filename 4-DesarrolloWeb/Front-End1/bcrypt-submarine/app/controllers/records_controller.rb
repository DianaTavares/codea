get '/records' do
  #¿Qué va en esta parte para obtener la lista de ganadores (juegos ganados)? Ordenados en orden descendente
	#Primero obtengo tosas las rondas donde se gano
	rounds_won = Round.where(result: "Winner!")
	usuarios = User.all
	@user_rounds_won = []
	usuarios.each do |user|
		@user_rounds_won << [user.name, rounds_won.where(user_id: user.id).count]
	end
	p "user_roun "*10
	p @user_rounds_won.sort!
	erb :record
end
