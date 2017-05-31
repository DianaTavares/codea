#Agrega una variable de clase a la superclase Vehicle que pueda darle seguimiento al número de objetos creados que heredan de la superclase. También crea un método que imprima el valor de esta variable de clase.

class Vehicle
@@cont=0

#agregaos self para ser un metodo de clase, es decir, que se aplica a las clases!!
def self.number_of_vehicles
  "This Superclass has created #{@@cont} vehicles"
end
end

class Car < Vehicle
  def initialize
    @@cont+=1
  end
end

class Bus < Vehicle
  def initialize
    @@cont+=1
  end
end

#test
car_1 = Car.new
car_2 = Car.new
bus_1 = Bus.new

p Car.number_of_vehicles == "This Superclass has created 3 vehicles"