get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @posts = Post.all
  erb :index
end
