class View
  def initialize
    puts "Bienvenido a Maratón"
    puts "Te daremos una pregunta y deberás elegir entre las respuestas cual es la correcta."
    puts " Listo?  Arranca el juego!"
  end

  def new_turn(question, options)
    #como la respuesta correscta esta dentro de un arreglo, la respuesta dle usuario tambien para que las pueda comparar
    a = []
    puts
    puts "Pregunta:"
    puts question
    puts "Opciones: "


    #### Revisar esto (Array.new(5){ |item| "x" } + Array.new(4){ |item| "o" }).sort_by { rand } para que imprim las respuetas de manera aleatoria

    #aqui me quede!!
    a <<gets.chomp
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






