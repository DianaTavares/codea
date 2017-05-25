=begin
Función Factorial

Crea el método factorial que recibe como parámetro un entero positivo y regresa el factorial.

El factorial es la multiplicación de todos los enteros desde 1 hasta el número.
=end

def factorial(n)
  #El factorial de cero es uno, y como no se calcula por medio de la multiplicacion de los numeros que lo proceden y el mismo, lo pongo como un condición aparte. 
  if n==0 
    1
  else
    (1..n).inject{|fac,n| fac*n}
  end
end
# Pruebas

p factorial(5) == 120
p factorial(4) == 24
p factorial(0) == 1
p factorial(1) == 1
p factorial(6) == 720