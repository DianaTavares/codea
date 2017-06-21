#Crea la clase Computer y agrega un método para cambiar y ver el color de la computadora.

class Computer
  attr_accessor :color
  attr_reader :processor
  def initialize(color,processor)
    @color=color
    @processor=processor
  end
end
mac=Computer.new("white","Intel")
p mac.color
#test
mac.color = "Platinum"
p mac.color

#Crea la clase "Computer" y agrega un método que permita solamente ver y no modificar el procesador de la computadora.

#test
p mac.processor
#=>"Intel"
mac.processor = "AMD"
#=>...undefined method `processor='...