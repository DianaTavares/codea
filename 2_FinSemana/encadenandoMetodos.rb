# TODO: Refactoriza buscando elegancia 
def shout_backwards(string)
  all_caps  = string.upcase.reverse + "!!!"
end


# AYUDAME: Refactoriza buscando elegancia 
#El metodo busca los numeros primos de un arreglo y los eleva al cuadrado
def squared_primes(array)
  array2=[]
  #asi encontraremos los numeros primos (y el uno) del arreglo
  array2=array.find_all {|x|
    (2..x-1).select(){|i| x % i == 0 }.count == 0} 
  #ahora elevamos al cuadrado los numeros primos del arreglo
  array2=array2.map{|p| p*p}
end


# Driver code... no edites este texto. En la consola esto deberá imprimir puros trues
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]
