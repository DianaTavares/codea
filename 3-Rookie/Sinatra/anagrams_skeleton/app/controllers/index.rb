get '/' do
  erb :index
end

get '/anagrams/:new_word' do
	@new_word = params[:new_word]
	@lista = Word.anagrams(params[:new_word])

  erb :word
end

post '/new_word' do
  redirect to ("/anagrams/#{params[:user_word]}") 
end