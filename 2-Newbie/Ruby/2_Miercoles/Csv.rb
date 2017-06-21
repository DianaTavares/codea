#Crear la clase Person con los siguientes atributos: first_name, last_name, email, phone, created_at

#librerias que se requieren en este archivo: Faker para crear informaciòn falsa y cvs para crer archivos (asi como lerlos y modificarlos)
require 'faker'
require 'csv'

#Esta clase crea instancias de usuarios con la infomracion dentro del initialize, pero si al crear la instancia no se itnroduce algun valor, los creara con la libreria Faker. La forma de usar Faker la encontre en https://github.com/stympy/faker
class Person
  def initialize(first_name=Faker::Name.first_name, 
                 last_name=Faker::Name.last_name, 
                 email=Faker::Internet.email,
                 phone=Faker::PhoneNumber.phone_number, 
                 created_at=Faker::Date.backward)
    @first_name=first_name
    @last_name=last_name
    @email=email
    @phone=phone
    @created_at=created_at
  end

#Este metodo me ayuda cambiar la instancia en un arreglo, esa es la raon por la que se escribio "", "", cada elemento separado por coma es un elemento del arreglo.
  def to_s
    return "#{@first_name}", "#{@last_name}", "#{@email}", "#{@phone}", "#{@created_at}"
  end
end

#Este metodod crea el numero de personas marcadas por su argumento, lo hace guardando cada persona en un arreglo a traves de la classe Person.
def create_persons(num)
  i=0
  a=[]
  while i<num
    a<<Person.new.to_s
    i+=1
  end
  a
end

#Esta clase sirve para crear un archivo donde se guarde el numero de personas creadas. Requiere de los argumentos file que es el nombre con el que se guardara el archivo, y el arreglo que guardará en el achivo.
class PersonWriter

  def initialize(file, create_persons)
    @file=file
    @people=create_persons
  end
  #la primer liena de codigo de este metodo crea un archivo con el nombre que ya se especifico, "w" significa que solo tiene permoso de escritura, aqui hay mas https://stackoverflow.com/questions/3682359/what-are-the-ruby-file-open-modes-and-options. cada elemento del arreglo se guardará en una linea diferente del archivo, de ahi el each en @people que es el arreglo. 
  def create_csv
    CSV.open(@file, "w") do |csv|
      @people.each do |i|
        csv << i
      end
    end
  end
end

#Esta clase lee un archivo y su información lo convierte en una instancia a través de la clase Person. Cada linea de información en el archivo lo introduce en un arreglo. Solo requiere el nombre del archivo como atributo.
class PersonParser
  def initialize(file)
    @file=file
  end

  def people
    a=[]
    CSV.foreach(@file) do |row|
      #Lo regresamos a la clase Person para que el arreglo resultado de la lectura del archivo lo convierta en una instancia
    a<<Person.new(row[0], row[1], row[2], row[3],row[4])
    end
    a
  end
end

#CREAR un archivo csv

#se cran 15 personas y su informacin, guardando el arreglo de arreglos resultdo en  create_persons
create_persons=create_persons(15)

p create_persons

person_writer = PersonWriter.new("people.csv", create_persons)
person_writer.create_csv


#Para LEER un archivo csv

parser = PersonParser.new('people.csv')
people = parser.people

#con esto imprimo solo los primeros 10
p people[0..10]
puts

#MODIFICAMOS la persona cero del arreglo de datos
people[0] = Person.new('Diana', 'Lopez', 'diana@hola.com', '47737489668', '2017-05-30')


#Guardamos los cambios en el archivo creado, pero primero necesitamos que people sea un arreglo, yha que por el momento es una isntancia de la clase Person
array=[]
people.each do |i|
  array<<i.to_s
end
puts

#ahora si estamos listos para llamar la clase y sus metodos para reescribir el archivo csv
person_writer = PersonWriter.new("people.csv", array)
person_writer.create_csv


