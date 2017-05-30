=begin
 Crea las siguientes clases: Animal, Dog, Turtle, Macaw, Fish, Dolphin, Reptile, Cat, Whale, Snake, Mammal, Bird. El objetivo de este ejercicio es relacionar todas estas clases con herencia, de tal manera de colocar los comportamientos correctos en las clases correctas.

Define un comportamiento común que pueda ser heredado por todas las clases. Crea una constante en las clases Dog, Turtle, Macaw, Fish, Dolphin, Cat, Whale y Snake que guarde información de estas clases y las diferencie de las demás. Al final muestra la información de estas constantes a través de comportamientos definidos de cada clase.

Hay que crear las pruebas correspondientes. Recuerda que las pruebas deben regresar true. 
=end

class Animal
  def initialize

  end
  def eat
    "este animal come"
  end
end

class Reptile < Animal
  def has_scales?
  end
end

class Mammal < Animal
  def initialize

  end 
  def warm_blooded?
    true
  end
end

class Bird < Animal

end

class Fish < Animal
  NADA = 'Estos animales pueden nadar'
  def swim
    NADA
  end
end

class Dolphin < Fish
  TIENE = 'se considerado un animal inteligente'
  def diferencia
    TIENE
  end
end

class Dog < Mammal
  def initialize

  end
  PUEDE= 'este animal puede labrar, wuao wuao..'
  def diferencia
    PUEDE
  end
end

class Turtle < Reptile
  TIENE = 'su hogar es un caparazon'
  def diferencia
    TIENE
  end
end

class Macaw < Bird
  ES = 'tiene un plumaje de muchos colores'
  def diferencia
    ES
  end
end


class Cat < Mammal
  SONIDO = 'Estos animales hacen Miaw...'
  def diferencia
    SONIDO
  end
end

class Whale < Fish
  TAMAÑO = 'son de los animales más granes'
  def diferencia
    TAMAÑO
  end
end

class Snake < Reptile
  MOVIMIENTO = 'Las serpientes se arrastran por el suelo para avanzar'
  def diferencia
    MOVIMIENTO
  end
end


#pruebas

#Creamos algunas instancias
chihuahua=Dog.new
tortuga=Turtle.new
silvestre=Cat.new
willy=Whale.new
ave=Macaw.new

#creando algunas pruebas de coortameintos compartidos y diferentes
#todos los animales comen!
p chihuahua.eat==tortuga.eat

#solo los Mammal tienen sangre caliente y solo los fish nadan
p silvestre.warm_blooded?
p willy.swim=='Estos animales pueden nadar'

#Pero los animales tienen sus diferencias
p chihuaha.diferencia != ave.diferencia

