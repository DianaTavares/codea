class View
  def initialize
    puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."
    puts " Listo?  Arranca el juego!"
  end

  def options
    puts "Elige el Deck con el que quieres jugar"
    puts "1 Capitales de Estados de México"
    puts "2 Capitales de América"
    puts "3 Capitales de Europa"
    gets.chomp
  end

  def new_turn(question)
    puts
    puts "Pregunta:"
    puts question
    print "Intento: "
    gets.chomp
  end

  def evaluated_answer(compar)
    if compar 
     puts "Correcto :D" 
    else
      puts "Incorrecto :(" 
    end
  end

  def game_over(correct, wrong)
    puts
    puts "Acabaste:"
    puts "Tuviste #{correct} correctas y #{wrong} incorrectas"
  end
end






