# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
  #¿Qué va en esta parte para cerrar la sesión?
	session.clear
	redirect '/'
end

# POSTS ============================================

post '/signin' do
  #¿Qué va en esta parte para ingresar al juego?
	@user = User.find_by_email(params[:email])
	if @user
		if @user.password == params[:password]
			session[:user_id]=@user.id
			erb :secret
		else
			session[:error] = "La contraseña es incorrecta"
			redirect '/signin'
		end
	else
	session[:error] = "Usuario no registrado"
		redirect '/'
	end
end
