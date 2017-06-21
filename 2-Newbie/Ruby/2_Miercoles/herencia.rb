#Herencia
#Fíjate en las siguientes clases, trata de relacionarlas y crea los métodos para hacer pasar el driver code. Pon antención en el método que te pedimos en la clase 'Vehicle' el cual hará uso de la "Self keyword" que vimos anteriormente.


class Vehicle
  attr_reader  :color, :age, :has_motor, :tank_size, :refuel, :number_of_wheels, :number_of_gears
 
  

  def what_am_i?
    self.class
  end

  def age!
    if @age < 2000
      puts "old vehicle"
    else
      puts "new vehicle"
    end
  end

end

class Motorized < Vehicle 
  def initialize(age=1988)
    @age=age
  end
end

class Motorbike < Vehicle
  def initialize(age=2005)
    @age=age
  end
end

class Car < Vehicle
  def initialize (age=2010)
    @age=age
  end
end

class Bicycle < Vehicle
  def initialize (number, age=1996) 
      @number=number
      @age=age
  end
end

class Skateboard < Vehicle
  def initialize (age=1999)
    @age=age
  end
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]


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
