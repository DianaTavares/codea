before '/home/profile' do
  unless session[:user_id]
  	session[:mensaje]="TIENES QUE LOGEARTE PRIMERO!"
  	redirect to('/')
  end
end

get '/home/1' do
  	erb :login
end

post '/login' do
	p email = params[:email]
	p password = params[:password]
	if User.authenticate(email, password)==2
		redirect to('/create')
	elsif User.authenticate(email, password)==1
		redirect to('/')
	else
		@user=User.authenticate(email, password)
		session[:user_id] = @user.id
		redirect to ("/home/profile")
	end
	
end

get '/home/profile' do 
 
  @user = User.find(session[:user_id])

  p @user.id
  @all_urls_user = Url.where("users_id = #{@user.id}")
  p "*"*50
  p @user
  p @all_urls_user
  erb :profile
end

get'/home/create' do
	erb :create
end

post '/create' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	
	if User.authenticate(email, password) == 2 
		user = User.create(name: name, email: email, password: password)
		if user.save
			p '*'*50
			p "se guardo el usuario"
			redirect to ("/home/1")
		else
			p "no se guardo el usuario"
			redirect to("/home/1")
		end
		redirect to ("user/#{user.id}")
	else
		p '*'*50
		p "el correo y/o usuario ya esta registrado"
		redirect to("/home/create")
	end
end

get '/home/close' do
	session[:user_id] = nil
	redirect to("/")
end