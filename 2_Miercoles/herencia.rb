#Herencia
#Fíjate en las siguientes clases, trata de relacionarlas y crea los métodos para hacer pasar el driver code. Pon antención en el método que te pedimos en la clase 'Vehicle' el cual hará uso de la "Self keyword" que vimos anteriormente.


class Vehicle

  def what_am_i?
    # Este método va a ser utilizado por varias clases y deberá regresar 
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
    what_am_i?.class
  end
end

class Motorized < Vehicle
end

class Motorbike < Vehicle
end

class Car < Vehicle
end

class Bicycle < Vehicle
  def initialize (number) 
    @number=number
  end
end

class Skateboard < Vehicle
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]

p moto.class
p car.what_am_i?
=begin
vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end
=end