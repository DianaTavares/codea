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
    #la age de who debe calcularse con el etodo protected, ya que no tiene aceso al private
    #la age del gato princila (el que llama al metodo) puede calcularse con cualquiera de los dos
    cat_years_private > who.cat_years_protected
  end

  protected

 def cat_years_protected
  cat_years_private
end  

  private

def cat_years_private
  @age * CAT_YEARS
end

end

#test
katty = Cat.new(2)
peto = Cat.new(4)
p katty.es_mayor_que?(peto) == false
#=>true ,