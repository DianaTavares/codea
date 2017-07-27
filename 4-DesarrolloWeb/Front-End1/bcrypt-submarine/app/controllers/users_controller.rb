# GETS ============================================

get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
  #¿Qué va en esta parte para registrar al jugador?
	@user =User.find_by_email(params[:email])
	if @user
 		session[@error] = "El email ya ha sido usado por otro usuario"
		redirect '/signup'
	else
		@user=User.create(name: params[:name], email: params[:email], password: params[:password])
	end
	redirect '/'

end
