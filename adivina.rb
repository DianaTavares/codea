=begin
  Adivina El Número

Crea la clase NumberGuessingGame. Al crear una instancia de la clase (NumberGuessingGame.new) el programa asigna un número aleatorio entre 0 y 9, el cual deberemos adivinar después con el método guess.

El método NumberGuessingGame#guess recibe un entero y regresa:

"Too low", si el número es más pequeño que el número aleatorio que asignó el programa.
"You got it!", si el número es el mismo que el número aleatorio.
"Too high", si el número es más grande que el número aleatorio que asignó el programa.
=end

class NumberGuessingGame
  def initialize
    @@value = rand(0..9)
  end
  def guess(num)
    #p @@value
    if num<@@value
      "Too low"
    elsif num==@@value
      "You got it!!"
    else
      "Too high"
    end
  end   
end


option="l"
num=10
while option !="s"
  game=NumberGuessingGame.new
  while game.guess(num)!="You got it!!"
    p'Adivina! ¿De qué número se trata?'
    num=gets.chomp.to_i
    p game.guess(num)
  end
  p 'Presiona cualquier tecla jugar de nuevo o la tecla "s" para salir del progama'
  option=gets.chomp
end
  
  






