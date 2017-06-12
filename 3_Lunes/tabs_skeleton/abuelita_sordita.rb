=begin
Muchas veces como programador te pedirán que modeles algún proceso o situación real en código. Esta vez tendrás que modelar y replicar la interacción de dos personas. La situación es la siguiente.

Modela una interacción entre una persona y su abuela que esta un poco sorda. Para esto tendrás que echar a volar tu imaginación y seguir las siguientes pautas.

Como la abuela esta sorda cualquier cosa que le digas ella responderá gritando "HUH?! NO TE ESCUCHO, HIJO!"
Si gritas para intentar que te escuche, lo va a entender mal y responderá gritando "NO, NO DESDE 1983"
Para poder irte y dejar de hablar con ella tendrás que con mucho amor decir "BYE TQM
=end

def deaf_grandma 
  number_of_byes=0;
  your_answer=""
  gradma_answer=""
  #begin the convertation
  puts "Abuela: HOLA MIJITO. QUE BUENO QUE VINISTE A VERME"

  while number_of_byes!=3
    puts "Tu: "
    your_answer= gets.chomp
    if your_answer ==your_answer.upcase
      puts answer_screaming
    elsif your_answer == "BYE TQM"
      number_of_byes+=1
      puts normal_answer
    else
      puts normal_answer
    end
  end
  puts "Abuela: ADIOS MIJITO, ME SALUDAS A TU MAMÁ. VUELVE PRONTO"
end

def answer_screaming
  "NO, NO DESDE 1983"
end

def normal_answer
  "HUH?! NO TE ESCUCHO, HIJO!"
end

def_grandma
