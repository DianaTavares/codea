#Clase Stair

#Crea la clase Stair con atributos material y size. Asimismo, define el método larger_size_than? que permite saber si una escalera es más grande que otra. Es importante considerar que el método getter size no debe ser público, de tal manera que si lo tratas de usar en una instancia (stair_one.size) levantará un error.

class Stair

  def initialize(material, size)
    @material=material
    @size=size
  end

  def larger_size_than?(who)
    size=who.size
    @size > size
  end

  protected 
  def size
    @size
  end

end

#test
metal = Stair.new("Metal", 54)
wood = Stair.new("Wood", 23)
p "Well done!" if metal.larger_size_than?(wood)

#p metal.size    marca error por ser un metodo protegido