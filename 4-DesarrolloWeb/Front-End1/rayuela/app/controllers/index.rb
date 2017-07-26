get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/reiniciar' do
	erb :index
end