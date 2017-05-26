#Para este ejercicio tendrás que crear de nuevo dos métodos que reciban un integer positivo n y regresen el el nth fibonacci number, un método iterativo y un método recursivo.

def fibonacci_iterative(num)
  #guardare los numeros de la lista de fibonacci en un arreglo y num sera la cantidad de elementos de ese arreglo, pero como debe iniciar en cero, por eso le resto uno.
  num-=1
  fib=[]
  if num==-1
    fib<<0
  elsif num==0
    fib<<1
  else
    fib<<1
    fib<<1
    (2..num).each do |i|
      fib<<fib[i-1]+fib[i-2]
    end
  end
  fib[-1]
end

#recursivo significa que el metodo se llama a si mismo.
def fibonacci_recursive (num)
  num<=1? num : fibonacci_recursive(num-1)+fibonacci_recursive(num-2)
end

#Pruebas
p fibonacci_iterative(0) == 0
p fibonacci_iterative(1) == 1
p fibonacci_iterative(2) == 1
p fibonacci_iterative(3) == 2
p fibonacci_iterative(4) == 3
p fibonacci_iterative(5) == 5

p fibonacci_recursive(0) == 0
p fibonacci_recursive(1) == 1
p fibonacci_recursive(2) == 1
p fibonacci_recursive(3) == 2
p fibonacci_recursive(4) == 3
p fibonacci_recursive(5) == 5

#Para medir la ed¡ficacia de cada metodo usamos benchmark
require 'benchmark'
 p 'Tiempo recursivo'
 p Benchmark.measure {fibonacci_recursive(10)*1_000}
 puts
 p 'Tiempo iterativo'
 p Benchmark.measure {fibonacci_iterative(10)*1_000}

#El metodo iterativo es más rapido, esto se debe a que el iterativo llama demasiadas veces a la funcion para poder dar el resultado, por ejemplo para n=6, llama al metodo 14 veces!!y es exponencia, n=7, la llama 14+8 veces. 
