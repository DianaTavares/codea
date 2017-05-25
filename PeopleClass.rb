=begin
Clase People
Crea la clase People que permita crear tres objetos People con diferentes nombres. Haz pasar las pruebas correspondientes.
=end

class People
  def initialize(nombre)
    @nombre=nombre
  end
  def speak
    "#{@nombre} is talking to you..."
  end
end

people_1=People.new("Rodrigo")
people_2=People.new("Carlos")
people_3=People.new("Rodrigo")

#test
p people_1.speak == "Rodrigo is talking to you..."
p people_2.speak == "Carlos is talking to you..."
p people_3.speak == "Rodrigo is talking to you..."