#Primer ejemplos de Procs, sirve para rehitilizar bloques.
count = 1
my_proc = Proc.new { count * 2 }

p my_proc.call

#Llamando un proc desde un metodo, al llamar al Proc se sale del metodo, pues contiene al return
def call_proc
  puts "Before proc"
  my_proc = Proc.new { return 2 }
  my_proc.call
  puts "After proc"

end

p call_proc

def call_proc
  puts "Before proc"
  my_proc = Proc.new { p "Hola desde el Proc" }
  my_proc.call
  puts "After proc"

end

call_proc

puts
#El Proc siendo el argumento de un metodo!!
numbers = [2, 4, 7, 10]
square = Proc.new { |number| number ** 2 }
p numbers.map(&square)

puts
#Lambda es sólo un objeto Proc especial. Para definirlo se usa la palabra reservada lambda y el bloque entre llaves {}.
this_is_a_lambda = lambda { "This is a Lambda"}
p this_is_a_lambda.call

#Los lambdas pueden también tomar argumentos.
cube = lambda { |x| x ** 3}
p cube.call(5)

#También es posible pasarle un lambda a un método que tomaría el bloque como argumento.
strings = ["ruby", "java", "c++", "javascript"]
char_upcase = lambda { |char| char.capitalize}
p symbols = strings.collect(&char_upcase)

#Diferencias entre Procs y Lambdas
# Funciona
puts
my_lambda = lambda { return 1 }
puts "Lambda result: #{my_lambda.call}"
puts

# Funciona
def current_method
  my_proc = Proc.new { return 1 }
  puts "Proc result: #{my_proc.call}"
end

p current_method
puts


my_proc = Proc.new { 1 }
puts "Proc result: #{my_proc.call}"
puts


