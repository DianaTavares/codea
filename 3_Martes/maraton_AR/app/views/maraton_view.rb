class View
  # Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  
  def initialize 
  end
  
  def welcome
  puts "-"*50
  puts "**Bienbenido a Maratón.**".center(50)
  puts "-"*50
  puts
  puts "1) Login"
  puts "2) Signup"
  puts "3) Scores"
  gets.chomp
  end

  def login
    email_password=[]
    puts "-"*50
    puts "Login".center(50)
    puts "-"*50
    puts
    print "Email: "
    email_password << gets.chomp
    print "Password: "
    email_password << gets.chomp
    email_password
  end

  def maraton
    puts
    puts "-"*50
    puts "**Bienvenido a Maraton de Capitales!**".center(50)
    puts "Elige un deck para jugar".center(50)
    puts "-"*50
    puts
    puts "1) Capitales de México"
    puts "2) Capitaes de América"
    puts "3) Capitales de Europa"
    gets.chomp
  end

  def new_turn (question,options)
    options_text = []
    options.each do |option|
      options_text << option.option
    end
    options_random = options_text.sort_by{rand}
    b = ["a", "b", "c"]
    puts
    puts "La capital de:"
    puts question.text
    puts 
    for i in 0..2
      puts "#{b[i]}- #{options_random[i]}"
    end
    print "¿Qué opció eliges? "
    letter_option = gets.chomp
    for i in 0..2
      if letter_option == b[i]
        user_answer = options.where(:option => options_random[i])
      end 
    end
    puts
    if user_answer[0].status
      puts "Correcto :D"
    else 
      puts "Incorrecto :("
    end
    user_answer
  end

  def score(c, w)
    puts
    puts "Terminaste!!"
    puts "Tuviste #{c} Correctas y #{w} Incorrectas."
  end

  def create
    #name, email and password
    nep =[]
    puts
    puts "-"*50
    puts "**Signup**".center(50)
    puts "-"*50
    puts
    puts "Proporciona la información que se te solicita"
    print "Nombre: "
    nep << gets.chomp
    print "Correo: "
    nep << gets.chomp
    print "Contraseña: "
    nep << gets.chomp
    nep
  end

  def gracias
    puts
    puts "Gracias por registrarte!"
  end

  def error_correo
    puts "Ese correo ya ha sido registrado, intente uno nuevo"
  end

  def scores(games)
    puts 
    puts "-"*60
    puts "**Score**".center(60)
    puts "-"*60
    puts
    print "Nombre".center(10), "|".center(10), "Deck".center(10), "|".center(10),  "Score".center(10), "|".center(10)
    puts " "
    puts "-"*60
    games.each do |game|
      print "#{game.user.name}".center(10), "|".center(10), "#{game.deck.subject}".center(10), "|".center(10), "#{game.correct}".center(10), "|".center(10)
      puts
    end
  end

end