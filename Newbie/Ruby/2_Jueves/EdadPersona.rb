#Crea la clase Person y define el método age que llame a un método para calcular la edad de la persona. Es necesario usar un método nativo de ruby que te ayude a obtener el año actual.

class Person
  def initialize(name, year_born)
    @name=name
    @year_born=year_born
  end

  def age
    "#{@name} is #{years_old} years old."
  end

  private
  
  def years_old
    Time.now.strftime("%Y").to_i-@year_born
  end

end

carlos=Person.new('Carlos', 1987)
martha=Person.new('Martha', 1991)


#test
p carlos.age == "Carlos is 30 years old."
#=>true
p martha.age == "Martha is 26 years old."
#=>true

p carlos.years_old
#=>private method `years_old'...(NoMethodError)
 