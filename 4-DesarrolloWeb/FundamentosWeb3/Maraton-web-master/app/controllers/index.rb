get '/' do
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/stats' do
  @rounds = Round.all
  erb :stats
end

get '/new_deck' do
  erb :new_deck
end

post '/new_deck' do
  name = params[:name]
  @deck = Deck.new(name: name)
  if @deck.save
    session[:message] = 'Guardado correctamente'
    erb :new_card
  else
    session[:message] = 'Error al guarda tu Deck'
    erb :new_deck
  end
end

post '/new_card' do
  card = Card.new(question: params[:question], option_1: params[:answer_1], option_2: params[:answer_2], option_3: params[:answer_3], correct_option: params[:correct_answer], deck_id: params[:deck])
  if card.save
    session[:message] = "Carta guardada"
  else
    session[:message] = "Carta no guardada"
  end
  if params[:save] == 'Guardar y Terminar'
    redirect '/'
  else
  @deck = Deck.find(params[:deck])
  erb :new_card
  end
end 

get '/new_game' do
  @decks = Deck.all
  # Agregar decks que sólo tiene cartas
  erb :decks
end

get '/deck/:id' do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  @round = Round.create(deck_id: @deck.id)
  erb :game
end

post '/finish_round' do
  answers = params[:option]
  @deck = Deck.find(params[:deck])
  correct = 0
  incorrect = 0
  guesses = answers.map do |card, answer|
    check = answer.to_i == Card.find(card.to_i).correct_option
    check ? correct += 1 : incorrect += 1
    guess = Guess.create(card_id: card.to_i, round_id: params[:round], correct: check, user_id: session[:user_id])
  end
  @round = Round.find(params[:round])
  @round.update(deck_id: @deck.id, num_guesses: guesses.count, correct_guesses: correct, incorrect_guesses: incorrect, user_id: session[:user_id])
  erb :results
end

get '/new_user' do
  erb :new_user
end

post '/new_user' do
  name = params[:name]
  @user = User.find_by_name(name)
  unless @user
    @user = User.create(name: name)
    session[:message] = "Usuario creado correctamente"
  else
    session[:message] = "Bienvenido de nuevo #{@user.name}!"
  end
  session[:user_id] = @user.id
  p session
  redirect '/'

end