#Self dentro de un contexto global

puts "self es igual a: #{self}"
#Self es igual a main, ya que esta en a seccion principal del programa, el objeto más alto del programa, tambien llamado top-level o namespace.

#Self dentro de una clase

class DummyClass
  puts "Esto esta corriendo cuando se define la clase"
  puts "En este contexto self es igual a: #{self}"
end

dummy1=DummyClass.new
#El resultado de este self dice "DummyClass" significa que esta dentro de esta clase.

#Self dentro de un metodo de clase

class DummyClass2
  def instance_method
    puts "Esto esta corriendo cuando se llama al metodo de clase"
    puts "En este contexto self es igual a: #{self}"
  end
end

dummy2=DummyClass2.new
dummy2.instance_method
#Esto imprime #<DummyClass2:0x007fd36c093cc8> 

#dentro de class methods

class DummyClass3

    def self.class_method
            puts "Dentro de un método de clase"
        puts "En este contexto self es igual a: #{self}"
    end
end

dummy_class = DummyClass3.new()
puts DummyClass3.class_method 

#El resultado de esta ultima linea de codigo es "DummyClass3", por lo que indica ese metodo donde esta. 