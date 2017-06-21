=begin
Clase Cat
Crea una clase Cat que permita crear objetos Cat con diferentes nombres y que le permita al gato realizar las siguientes acciones: meow, run y jump. Haz pasar la pruebas correspondientes.
=end

#Creando la clase con sus acciones
class Cat
  def initialize(name)
    #variable de la instancia
    @name = name
  end
  def self.meow
    "Miau... Miau..."
  end
  @@b=0
  def run (a=0)
    @@b+=a
    "Corriendo #{@@b} mts..."
  end
  def jump
    "Saltando..."
  end
end

#creando los objetos, excepto cat_3, ya que ese se crea en el test
cat_1=Cat.new("bolita")
cat_2=Cat.new("algodon")

cat_4=Cat.new("kitty")
cat_5=Cat.new("loli")

#test

cat_3 =Cat.new("catty")

p cat_1.jump == "Saltando..."
p cat_5.jump == "Saltando..."
p Cat.meow == "Miau... Miau..."
p cat_3.run == "Corriendo 0 mts..."
p cat_3.run(20) == "Corriendo 20 mts..."
p cat_3.run(10) == "Corriendo 30 mts..."
p cat_3.run(10) == "Corriendo 40 mts..."
