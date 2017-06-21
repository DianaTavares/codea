
#No se puede cuanod local_var esta fuera del metodo ya que la variable que esta llamando el metodo es local, es decir, no puede usarse dentro del metodo. cuando la variable local_var esta dentro del metodo ya es posible obtener el resultado como se muestra a continuación:

#2 Dentro de una clase, si la variable no tiene el @ y no fue inicializada dentro de initialize, significa que no es una valiable de classe (o de instancia)y no puede usarse en otros metodos dentro de esa clase. 

$global_var = "This is a global variable"
CONSTANT = 3.1416

def global_var
  $global_var
end

def global_var=(value)
  $global_var=value
end

def constante
  CONSTANT
end

=begin
Esto no se puede hacer, sya que las constantes no pueden cambiar de valor
def constante=(value)
  CONSTANT=value
end
=end

class DummyClass
  #Esta es una varible de clase
  @@class_variable = "This is a class variable"

  def initialize
    @instance_var="this is my local var"
  end 
  def return_my_instance_var
    @instance_var
  end

  def change_my_variable=(value)
    @instance_var=value
  end
#Getter y Setter de la seccion de Class Variables
def class_variable
  @@class_variable
end

def class_variable=(value)  
  @@class_variable=value
end

def global_var
  $global_var
end

def global_var=(value)
  $global_var=value
end

def constante
  CONSTANT
end
=begin
Esto no se puede hacer, sya que las constantes no pueden cambiar de valor
def constante=(value)
  CONSTANT=value
end
=end
end

instancia=DummyClass.new
p instancia.return_my_instance_var

#Getter (leen informacion y la muestran, es el caso del metodo return_my_instance_var) y Setter (modifica la informaciòn como el caso del change_my_variable, observa como lleva el = entre el nombre del metodo y el argumento.) Loque vemos abajo con dos formas de lla,ar a un getter, las dos funcionan igual!!

p instancia.change_my_variable=("Bar")
p instancia.change_my_variable  ="Baz"

#Siguiendo los pasos de Class Variables

dummy_1=DummyClass.new
dummy_2=DummyClass.new

p dummy_1.class_variable
p dummy_1.class_variable==dummy_2.class_variable
#Con un Setter, dummy_1 cambia el valor de la variable de clase, por lo que tal camibio lo conserva para todas las instancias.
p dummy_1.class_variable=("he cambiado de valor")
p dummy_1.class_variable==dummy_2.class_variable

p dummy_2.global_var
p dummy_2.global_var=("la variable global cambia!!")
p dummy_2.global_var
p global_var
p dummy_1.constante
p constante
