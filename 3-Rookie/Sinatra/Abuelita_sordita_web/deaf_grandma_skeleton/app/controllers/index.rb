get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  if user_input == "BYE"
  	redirect "/?abuelita=ADIOS HIJO, VUELVE PRONTO"
  elsif user_input == user_input.upcase
  	redirect "/?abuelita=NO, NO DESDE 1983"
  else 
  	redirect "/?abuelita=HUM?...NO TE ESCUCHO"
  end
end

