class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 

#validando que el mail sea correcto
  validates :email, :format => { :with => /\w+(\.\w+)*@\w+\.[a-z]{2,3}/,
    :message => "email structure not valid" }
#[_a-z0-9-] que incluya valores de la a a la z y de 0 a 9. Como observamos os randos se comocan un con un -, y podemos poner un rango seguido del otro.
#[A-Za-z0-9-] que incluya valores de la a a la z, de la A a la Z y del 0 al 9
# \w es lo mismo que [A-Za-z0-9-]
#$ indica que debe segui un final de linea, por ello cmoo si encaja con [a-z]{2,3} pue encuentra cmo e ignora la otra o, pero con [a-z]{2,3}$ no lo toma en cuenta por que no tiene un salto de linea
#^ indica que es el inicio de la linea 
#* cero o mas veces
#+ una o mas veces
#? cero o un vez (opcional)

#Validar que el correo se unico
  validates :email, :uniqueness => true


  validates :age, numericality: {greater_than_or_equal_to: 18}

  validates :phone_number, :format => { :with => /\d{10,}/}

  def name
  p "#{first_name} #{last_name}"
  end

  def age
   t = Time.now
    p t.strftime("%Y").to_i - birthday.strftime("%Y").to_i
  end

  def phone_number
     phone.gsub!(/[^\d]/, '' )
  end

end
