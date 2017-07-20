before '/profile' do 
  unless session[:user_id]
  	session[:mensaje]="tienes que logearte"
  	redirect to('/')
  end
end


get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  	erb :index
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
		redirect to ("/profile")
	end
	
end



get '/profile' do
  @user = User.find_by_id(session[:user_id])
  erb :profile
end

get'/create' do
	erb :create
end

post '/create' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	
	if User.authenticate(email, password)==2 
		user = User.create(name: name, email: email, password: password)
		if user.save
			p '*'*50
			p "se guardo e usuario"
			redirect to ("user/#{user.id}")
		else
			p "no se guardo el usuario"
			redirect to("/")
		end
		redirect to ("user/#{user.id}")
	else
		p "el correo ya estaba registrado o no introdujo bien la información"
		redirect to("/")
	end
end

get '/secret_page' do
	if session[:user_id] != nil
		erb :secret_page
	else
		redirect to("/")
	end
end

get '/close' do
	session[:user_id] = nil
	redirect to("/")
end
