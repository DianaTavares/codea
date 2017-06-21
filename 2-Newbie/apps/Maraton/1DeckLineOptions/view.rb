class View
  def initialize
    puts "Bienvenido a Maratón"
    puts "Te daremos una pregunta y deberás elegir entre las respuestas cual es la correcta."
    puts " Listo?  Arranca el juego!"
  end

  def new_turn(question, options)
    #arreglo donde se coocaran las respuestas en desorden
    a=[]
    b=["a","b","c"]
    puts
    puts "Pregunta:"
    puts question
    puts 
    a=options.sort_by{rand}
    for i in 0..2
      puts "#{b[i]}- #{a[i]}"
    end
    print"Opcion correcta:  "
    letter_option=gets.chomp
    for i in 0..2
      if letter_option==b[i]
        user_answer=a[i]
      end
    end
      user_answer
  end

  def evaluated_answer(compar)
    puts
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






