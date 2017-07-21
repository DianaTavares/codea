get '/' do
   # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  erb :index
end

post '/urls' do
 p url_long=params[:url]
#llamamos al metodo crea, para crear el elemento en la base de datos y aparte tener la informacion en la instancia. 
 	new_url = Url.create_url(url_long, session[:user_id])

 #Esto es para poder imprimir la lista de los urls mini que se han creado. 
 @all_urls = Url.all
 p "todos los links..."*10
 p @all_urls.reverse
 erb :index
end


get '/:short_id' do
  short_id=params[:short_id]
  url_used = Url.find(short_id)
  url_used.counter += 1
  url_used.save
  redirect to ("#{url_used.url}")
  redirect to ("/urls")
end


