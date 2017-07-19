get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  #se introdujo un if que pregunta si viene de un request de JQ, si es asi, las condicionales que teniamos de lo que contesta la abuela ahora solo mandan los textos que queremos que se incluyan en la ventana entre comillas simpres. 
  if request.xhr?
    if user_input == "BYE"
      'Adios hijito'
    elsif user_input == user_input.upcase
     'NO, NO DESEE 1983'
    else 
      'HUM?...NO TE ESCUCHO'
    end 
  else
    if user_input == "BYE"
  	 redirect "/?abuelita=ADIOS HIJO, VUELVE PRONTO"
    elsif user_input == user_input.upcase
  	 redirect "/?abuelita=NO, NO DESDE 1983"
    else 
  	 redirect "/?abuelita=HUM?...NO TE ESCUCHO"
    end
  end

end

