#¿Es Mayor Qué?

#Define los métodos private y protected para calcular la edad del gato, así como también agrega el código que se necesita para que la prueba correspondiente sea true. Revisa la documentación correspondiente.

class Cat
  CAT_YEARS = 7
  attr_accessor :name, :age

  def initialize(name='cat', age)
    @name = name
    @age = age 
  end

  def es_mayor_que?(who)
    age=who.age
    @age > age
  end

  protected

 def cat_years
  @age * CAT_YEARS
end  

  private

def cat_years
  @age * CAT_YEARS
end

end

#test
katty = Cat.new(2)
peto = Cat.new(4)
p katty.es_mayor_que?(peto) == false
#=>true